# Newsmast Mastodon Plugin Custom Feeds Features

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
- **ContentFilters::CommunityAdmin**: Required model for identifying boost bot accounts

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
| `FeedManagerConcern` | Extends FeedManager with custom timeline methods |
| `FanOutOnWriteConcern` | Hooks into status creation for custom feed distribution |
| `CustomFeedInsertWorker` | Async worker for filtered status insertion |
