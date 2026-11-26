# Content filters

Content filters let a community or server operator hide unwanted statuses, hashtags and accounts by keyword. Rules are created in the Newsmast Dashboard and stored in the shared database; the gem enforces them.

## Data

| Table / model | Purpose |
| --- | --- |
| `server_settings` (`ServerSetting`) | Switches. `Content filters` and `Spam filters` turn each filter family on. |
| `keyword_filters` (`KeywordFilter`) | Global keywords. `filter_type` is `content`, `hashtag` or `both`. |
| `keyword_filter_groups` (`KeywordFilterGroup`) | Groups keywords under a server setting. |
| `patchwork_communities_filter_keywords` (`CommunityFilterKeyword`) | Per-community `filter_in` / `filter_out` keywords; `patchwork_community_id` NULL means global. |

The gem adds `is_banned` to `statuses` and `accounts`, and uses Mastodon's `listable` / `trendable` flags on tags.

## When a status is checked

- Remote statuses: queued (`BanStatusWorker`) when the record is created.
- Local statuses: queued after Mastodon finishes post-processing.

For each active keyword under an enabled filter family, `BanStatusService`:

1. Checks the author's username, display name and bio, and bans the account on a match.
2. For `hashtag` / `both` filters, makes matching tags unlistable and untrendable.
3. For `content` / `both` filters, matches the keyword as a whole word in the status text (HTML stripped, case-insensitive).
4. Records banned status IDs in Redis (`content_filters_banned_status_ids`, `spam_filters_banned_status_ids`, and a combined `excluded_status_ids`, capped at about 400 entries).

A banned status gets `is_banned = true`. If it is local, it is also marked sensitive with the spoiler text `Sensitive content!!!`. Statuses that are not banned continue to channel reblogging when channel mode is enabled (`MAIN_CHANNEL`, `BOOST_BOT_ENABLED`).

## Where banned content is hidden

- `Status.without_banned` and the `indexable` scope exclude banned statuses, so they do not appear in search indexes.
- Banned tags are excluded from tag lookups that respect `listable`.
- Feeds exclude IDs from `FeedService#excluded_status_ids` when the matching setting is on.
- Statuses from the `Threads` and `Bluesky` domains are excluded from a user's feeds when those server settings are on.

## Bulk re-scan workers

Run these from Sidekiq (or the console) after changing filters; they re-check existing data against all global keywords:

| Worker | Action |
| --- | --- |
| `StatusBannedWorker` | Bans existing statuses whose text matches. |
| `BanTagWorker` | Makes matching tags unlistable and bans their statuses. |
| `AccountBannedWorker` | Bans accounts whose domain, username, display name or bio matches. |

All three log progress and skip records that are already banned.

## Per-community filters

`BanStatusService#keyword_matches_in_status?` applies a community's `filter_in` and `filter_out` keywords (hashtag or text) when deciding whether a status belongs in that community's channel. Empty `filter_in` means everything is allowed; empty `filter_out` means nothing is excluded.
