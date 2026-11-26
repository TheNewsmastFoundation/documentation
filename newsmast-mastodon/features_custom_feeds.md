# Custom feeds

All endpoints are under `/api/v1/timelines` and return standard Mastodon status JSON.

## Channel feed

`GET /api/v1/timelines/@:username/feed`

Returns the custom timeline of a community boost-bot account (a Dashboard channel). Authentication is optional.

| Parameter | Meaning |
| --- | --- |
| `local`, `remote` | Restrict to local or remote statuses (ignored if both are set). |
| `only_media` | Only statuses with media. |
| `limit`, `max_id`, `since_id`, `min_id` | Standard pagination. |

Responses: `400` without a username, `404` if the account is unknown or not an active boost-bot community admin. Statuses come from the Redis sorted set `custom:<account_id>`, filtered to hide replies and reblogs, suspended or silenced accounts, and the viewer's language preferences. New statuses are added by `CustomFeedInsertWorker`.

## For You timeline

`GET /api/v1/timelines/for_you_custom_timeline` (authentication required, `read:statuses`)

Merges the user's home timeline with the shared local mix timeline (`feed:mix_channel_local_timeline`, the newest 400 public local statuses). It is filled only when `FOR_YOU_TIMELINE_ENABLED=true`.

Parameters: `limit`, `only_media`, `exclude_replies`, `exclude_direct_statuses`, `grouped_admin_statuses` (drops statuses from community admin accounts), `domain` (adds relay feeds, see below), plus pagination. The response includes `patchwork_post_reactions` for each status.

Boost-bot accounts can add or remove statuses in this shared timeline:

- `POST /api/v1/custom_statuses/add_custom_boost_bot_status`: params `client_id`, `client_secret`, `status_url`. Resolves the URL and adds the status.
- `POST /api/v1/custom_statuses/remove_custom_boost_bot_status`: params `client_id`, `client_secret`, `status_id`.

## Instances timeline

`GET /api/v1/timelines/instances_timeline` (authentication required, `read:statuses`)

Combines the user's home timeline with statuses delivered by relays from selected instances.

```text
GET /api/v1/timelines/instances_timeline
GET /api/v1/timelines/instances_timeline?domain=mastodon.social
GET /api/v1/timelines/instances_timeline?domain=mastodon.social,mastodon.beer
GET /api/v1/timelines/instances_timeline?domain[]=mastodon.social&domain[]=mastodon.beer
```

Parameters: `domain` (omit for all enabled relay domains), `only_media`, `exclude_replies`, `exclude_direct_statuses`, plus pagination. A domain that is not an enabled relay domain is rejected.

## Custom relays

Set `CUSTOM_RELAY_DOMAINS` to a comma-separated list of source instances:

```bash
CUSTOM_RELAY_DOMAINS=mastodon.social,mastodon.beer
```

`RelayEnvSyncWorker` (scheduler queue) subscribes the host to `https://relay.fedi.buzz/instance/<domain>` for each domain. Incoming statuses are stored per domain in Redis sorted sets named `feed:relay:<sanitized-domain>` (for example `feed:relay:mastodon-social`). Check a feed from the console:

```ruby
key = NewsmastMastodon::RelayFeed.timeline_key("mastodon.social")
RedisConnection.with { |redis| puts redis.zcard(key) }
```

Server owners can also manage relays over the API: `POST /api/v1/patchwork/relays` (`inbox_url`) and `DELETE /api/v1/patchwork/relays/:id`. Both require the Owner role.

## Other timeline changes

The home, public, list, tag, bookmarks, trends and account-status endpoints accept extra filters such as `exclude_direct_statuses`, `exclude_replies`, `only_reblogs` and `exclude_original_statuses`, and include `patchwork_post_reactions` in their responses.
