# Posts

## Drafts

Drafts are stored server-side (`patchwork_drafted_statuses`). Limits per account: 300 drafts in total and 25 created per day.

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/drafted_statuses` | Create a draft. Takes the same params as a status. |
| GET | `/drafted_statuses` | List drafts, grouped by date, paginated. |
| GET | `/drafted_statuses/:id` | Show a draft. |
| PATCH/PUT | `/drafted_statuses/:id` | Replace a draft. |
| DELETE | `/drafted_statuses/:id` | Delete a draft. |
| POST | `/drafted_statuses/:id/publish` | Delete the draft and post it (or schedule it, if `scheduled_at` is set). |

Reading needs `read:statuses`; writing needs `write:statuses`. Media attached to a draft is kept for publishing.

## Long posts

If the Dashboard setting `Long posts` is on, its value replaces Mastodon's 500-character limit. The new limit is enforced when posting and is reported to clients in `configuration.statuses.max_characters` of the instance API (v1 and v2). Invalid or missing values fall back to 500.

## Local-only posts

`POST /api/v1/statuses` accepts `local_only`. Local-only posts are not federated. Replies inherit the parent's value when the client does not set one, and boosts copy the original's. Clients check whether the feature is on with `GET /api/v1/local_only_posts/getLocalOnlySetting`, which returns `{ "local_only": true|false }`.

## Reactions

Emoji reactions, one per user per status:

- `PUT /api/v1/patchwork/statuses/:status_id/reactions/:emoji`: set or change your reaction.
- `DELETE /api/v1/patchwork/statuses/:status_id/reactions/:emoji`: remove it.

Allowed emoji come from `PATCHWORK_STATUS_REACTION_NAMES` (default `👍,❤️,😂,😮,😠`), with at most `PATCHWORK_STATUS_REACTION_EMOJI_LIMIT` (default 5). Timelines, status and context responses include `patchwork_post_reactions`.

## Link previews

`GET /api/v1/utilities/link_preview?url=...` returns metadata for a URL. Errors: `400` for a missing or invalid URL, `422` if fetching fails.

## Alt text

When `ALT_TEXT_ENABLED=true`, alt text is generated for images on local posts through [alttext.ai](https://alttext.ai/) (`ALT_TEXT_URL`, `ALT_TEXT_SECRET`). Users opt in with the alt text setting unless `SKIP_ALT_TEXT_USER_SETTING=true`.

## Reblogging and boosting

- **Channel reblogging:** after a status passes content filters, `MAIN_CHANNEL` or `BOOST_BOT_ENABLED` triggers reblogging by channel accounts (`REBLOG_*` variables). Post URLs use `LOCAL_DOMAIN`.
- **Boost service:** `BOOST_POST_ENABLED` and `BOOST_POST_*` send posts to a remote boost API.
- **Custom boost bots:** `{USERNAME}_INSTANCE_URL`, `{USERNAME}_CLIENT_ID` and `{USERNAME}_CLIENT_SECRET` configure a named bot account.
