# Newsmast Mastodon Plugin Custom Feeds Features

> **Newsmast Dashboard dependency:** The Dashboard is **Required** for channel-backed feeds and starter packs because it owns community, collection, and active boost-bot records through the **shared database**. The gem owns the feed runtime. The For You and FediBuzz instance timelines are **Not required** to use the Dashboard. See [Dashboard channels](../newsmast-dashboard/features_channels.md).

## Custom Timeline Management
- **Redis-backed Custom Feeds**: Per-account custom timelines stored in Redis with automatic trimming
- **Push/Unpush Operations**: Add or remove statuses from custom timelines
- **Timeline Population**: Build custom timelines from scratch using `populate_custom`
- **Merge/Unmerge Support**: Merge or remove an account's statuses from another account's custom timeline

## API Endpoints

### Custom Feed Timeline
```
GET /api/v1/timelines/@:username/feed  # Retrieve custom feed for a community admin account
```

> **Newsmast Dashboard required:** This endpoint reads community and community-admin records created by the Dashboard. The target community admin must be configured as an active boost bot.

**Parameters:**
- `local` (boolean) - Show only local statuses
- `remote` (boolean) - Show only remote statuses
- `only_media` (boolean) - Show only statuses with media
- `limit` (integer) - Number of statuses to return
- `max_id` (string) - Return results older than this ID
- `since_id` (string) - Return results newer than this ID
- `min_id` (string) - Return results immediately newer than this ID

**Requirements:**
- The target account must be a community admin with `is_boost_bot: true` and active status

### For You Custom Timeline
```
GET /api/v1/timelines/for_you_custom_timeline  # Personalised "For You" timeline for the authenticated user
```

Returns a personalised feed built for the authenticated account. Supports the standard timeline pagination parameters (`limit`, `max_id`, `since_id`, `min_id`).

This timeline is implemented by the gem using Mastodon and Redis data and does not require Newsmast Dashboard.

### Instances Timeline (Relay Feeds)
```
GET /api/v1/timelines/instances_timeline                                      # Home timeline merged with all enabled relay domains
GET /api/v1/timelines/instances_timeline?domain=mastodon.social              # Merge a single relay domain
GET /api/v1/timelines/instances_timeline?domain=mastodon.social,mastodon.beer # Merge multiple relay domains (comma-separated)
GET /api/v1/timelines/instances_timeline?domain[]=mastodon.social&domain[]=mastodon.beer # Merge multiple relay domains (array form)
```

The instances timeline subscribes the host Mastodon server to [FediBuzz](https://relay.fedi.buzz/) relay endpoints for the domains configured in `CUSTOM_RELAY_DOMAINS`, stores delivered statuses in per-domain Redis feeds, and exposes a merged home + instance timeline. The response always includes the authenticated user's home timeline and can include one, many, or all enabled relay domains.

This integration is configured through the environment and FediBuzz and does not require Newsmast Dashboard.

Configured domains are converted to relay inbox URLs in the form `https://relay.fedi.buzz/instance/<domain>`, and stored statuses use Redis sorted sets keyed as `feed:relay:<sanitized-domain>` (e.g. `feed:relay:mastodon-social`).

Configure the source domains with the `CUSTOM_RELAY_DOMAINS` environment variable (see [configuration.md](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md#custom-relay--instances-timeline)).

### Starter Pack Channels
```
GET /api/v1/channels/starter_packs_channels    # List available starter pack channels
GET /api/v1/channels/:id/starter_packs_detail  # Get details for a specific starter pack channel
```

> **Newsmast Dashboard required:** Starter pack definitions and their channel collections are created and managed in Newsmast Dashboard. The gem exposes that data through these Mastodon API endpoints.

Starter pack channels provide curated collections of accounts and channels that new users can follow to quickly populate their feeds.

## Configuration

The engine uses a singleton configuration pattern. Configuration options can be set in an initializer:

```ruby
# config/initializers/custom_feeds.rb
CustomFeeds.configure do |config|
  # Configuration options (currently extensible via the Configuration class)
end
```

### Dependencies
- **Redis**: Required for timeline storage
- **Sidekiq**: Required for background job processing
- **`ContentFilters::CommunityAdmin`**: Required for channel-backed custom feeds; its community-admin data is managed by Newsmast Dashboard

## Architecture

### Engine Setup
The engine mounts at the root path and:
- Isolates its namespace to `CustomFeeds`
- Auto-loads presenters from `app/presenters`
- Prepends concerns to core Mastodon services via initializers

### Key Components

| Component | Purpose |
|-----------|---------|
| `CustomFeeds::CustomFeed` | Query interface for custom timelines |
| `NewsmastMastodon::RelayFeed` | Query interface for per-domain relay feeds backing the instances timeline |
| `FeedManagerConcern` | Extends FeedManager with custom timeline methods |
| `FanOutOnWriteConcern` | Hooks into status creation for custom feed distribution |
| `CustomFeedInsertWorker` | Async worker for filtered status insertion |
| `RelayEnvSyncWorker` | Async worker that syncs `CUSTOM_RELAY_DOMAINS` relay subscriptions |
