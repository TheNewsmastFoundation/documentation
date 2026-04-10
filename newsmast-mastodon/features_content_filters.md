# Newsmast Mastodon Plugin Content FIlters Features
## Content Moderation & Filtering
- **Keyword Filtering**: Block posts containing specific keywords across different timeline types (hashtag, text, or both)
- **Hashtag Filtering**: Filter content based on hashtags with exact matching
- **Account Banning**: Automatically ban accounts based on username, display name, or bio content matching filter keywords
- **Status Banning**: Automatically mark statuses as banned and sensitive when they match filter criteria
- **Tag Banning**: Automatically mark tags as non-listable and non-trendable when they match filters
- **Spam Detection**: Separate spam filters with dedicated detection and blocking capabilities
- **Real-time Processing**: Background workers continuously monitor and apply filters to new content

## Federation Controls
- **Threads Integration**: Block or unblock posts from Threads from appearing in timelines
- **Bluesky Integration**: Control Bluesky post visibility in your server's feeds
- **Domain Filtering**: Filter statuses based on server settings and federation policies
- **Cross-platform Content Management**: Fine-grained control over federated content

## Community Channel Automation
- **Automated Reblogging**: Automatically boost posts to community channels based on filter rules
- **Newsmast Bot Integration**: Support for Newsmast-specific boosting via Lambda service
- **Custom Channel Support**: Configure boost behavior for custom community channels
- **Group Channel Management**: Manage group channels with automated boosting
- **Filter-based Boosting**: Only boost posts that pass community-specific keyword filters

## Advanced Search Capabilities
- **Account Search Enhancement**: Enhanced account search with `is_banned` filtering
- **Banned Content Exclusion**: Search results automatically exclude banned accounts and statuses
- **Following Network Search**: Advanced search for accounts within your following network
- **Elasticsearch Integration**: Custom Chewy indices for accounts, statuses, and public statuses

## Filter Management
- **Global Filters**: Server-wide keyword filters that apply to all users
- **Community Filters**: Community-specific filters with filter-in and filter-out support
- **Filter Types**: Support for hashtag-only, text-only, or combined filtering
- **Redis Caching**: Efficient filter caching with 24-hour expiration
- **Multiple Filter Sources**: Combine ContentFilters::KeywordFilter and ContentFilters::CommunityFilterKeyword

## Performance Optimizations
- **Batch Processing**: Process accounts, statuses, and tags in configurable batches (default 1000)
- **Redis Integration**: Fast banned content ID lookups using Redis sorted sets
- **Database Read Replicas**: Support for read replica routing for heavy queries
- **Selective Column Loading**: Load only necessary columns for better performance
- **Progress Tracking**: Real-time progress logging during batch operations

## Timeline Filtering
- **Home Timeline Filtering**: Filter home feed based on content filters and server settings
- **Public Timeline Filtering**: Enhanced public feed with reblog and reply filtering options
- **Excluded Status IDs**: Maintain separate Redis sets for content filters and spam filters
- **Direct Status Exclusion**: Option to exclude direct messages from timelines
- **Followed Tags Filtering**: Control visibility of posts from followed hashtags
- **Reply Filtering**: Option to exclude replies from feed

## Feed Service Integration
- **Server Setting Aware**: Automatically apply filters based on server configuration
- **Federation Filtering**: Filter content based on Threads and Bluesky server settings
- **Dynamic Filter Application**: Apply content filters and spam filters independently or together
- **Cache Management**: Efficient banned status ID management in Redis

## Database Migrations
The gem adds the following database columns:
- `accounts.is_banned` - Boolean flag for banned accounts (default: false)
- `statuses.is_banned` - Boolean flag for banned statuses (default: false)

## Redis Keys
The gem uses the following Redis keys:
- `excluded_status_ids` - Combined banned status IDs (content + spam filters)
- `content_filters_banned_status_ids` - Status IDs banned by content filters
- `spam_filters_banned_status_ids` - Status IDs banned by spam filters
- `spam_filters` / `channel:spam_filters` - Hash of spam filter configurations
- `content_filters` / `channel:content_filters` - Hash of content filter configurations

## Background Workers

### BanTagWorker
Checks tags against keyword filters and updates banned status:
```ruby
BanTagWorker.perform_async
```

### AccountBannedWorker
Checks accounts against keyword filters and bans matching accounts:
```ruby
AccountBannedWorker.perform_async
```

### StatusBannedWorker
Checks statuses against keyword filters and marks them as banned:
```ruby
StatusBannedWorker.perform_async
```

### BanStatusWorker
Checks individual status and applies banning or reblogging based on filters:
```ruby
BanStatusWorker.perform_async(status_id)
```

### ReblogChannelsWorker
Handles automated reblogging to community channels:
```ruby
ReblogChannelsWorker.perform_async(status_id, account_id)
```

## Rake Tasks

### Content Filters Management
```bash
# Check and update banned accounts
rake content_filters:update_banned_accounts

# Preview accounts that would be banned (no changes)
rake content_filters:preview_banned_accounts

# Reset all banned accounts (use with caution)
rake content_filters:reset_banned_accounts

# Update banned tags
rake content_filters:update_banned_tags

# Install Chewy index files
rake content_filters:install
```

## Usage

### Setting up Keyword Filters
1. Access the Content Filters section in your Patchwork Dashboard
2. Add keywords or phrases to block
3. Choose filter type: hashtag, text, or both
4. Set whether filters are active
5. Configure community-specific filters if needed

### Managing Federation Controls
1. Navigate to Server Settings in the dashboard
2. Enable/disable Threads integration
3. Configure Bluesky post visibility
4. Set federation policies

### Monitoring Banned Content
The gem automatically:
- Marks banned statuses as sensitive with spoiler text
- Sets banned accounts' statuses as banned
- Updates tag listability and trendability
- Maintains Redis caches of banned content IDs
- Logs all banning operations for audit purposes

### Account Search Integration
The gem enhances account search by:
- Excluding banned accounts from search results
- Supporting advanced search within following networks
- Providing exact word matching for filter keywords
- Integrating with Elasticsearch via Chewy indices
