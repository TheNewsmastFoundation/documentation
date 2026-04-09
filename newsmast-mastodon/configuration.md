# newsmast-mastodon configuration

## Accounts Management

Need to review all these in Unified Gem to ensure it's still relevant/pertinent

Custom Account Creation: Enhanced account creation with community admin integration
Auto-Follow: Automatically follow default accounts on signup (configurable via AUTO_FOLLOW_ACCOUNTS env var)
Server Settings: Automatic search opt-in/opt-out and Bluesky bridge configuration for new users
Extended Credentials: Account credentials API includes email in response
Push Notifications
Firebase Cloud Messaging (FCM): Full integration for iOS and Android push notifications
Token Management: Create, revoke, and manage notification tokens per device
Mute Control: Per-account mute status for notifications
Multi-Platform Support: Support for iOS, Android, and Huawei devices
Rich Notifications: Custom notifications for follows, mentions, reblogs, favourites, polls, and quotes
Password & Email Management
OTP-Based Password Reset: Secure 4-digit OTP verification for password reset
Password Change: Authenticated password change with current password verification
Email Change: OTP-verified email change with session revocation
Custom Mailers: Branded OTP confirmation emails
Authentication
Custom OAuth Behavior: Platform-specific authentication handling
External membership service authentication
Channel-Based Login: Role-based login restrictions for channel platforms
Doorkeeper Extensions: Password grant flow with LDAP/PAM support
User Preferences
Email Notification Settings: Toggle all email notifications on/off
Alt-Text Settings: User preference for alt-text reminders on media uploads
Locale Management: API endpoint for setting user language preference
Internationalization (i18n)
11 Supported Languages: English, German, Spanish, French, Italian, Japanese, Portuguese, Brazilian Portuguese, Russian, and Welsh
Standardized API Responses: Consistent, translatable error and success messages
Locale-Aware Responses: API responses respect user's locale preference
Mailer Customization
Branded Templates: Customizable email templates with logo and brand colors
Dynamic Branding: Support for custom mail header/footer logos via SiteUpload
App Store Links: Configurable iOS and Android app store links in emails
Database Extensions
Server settings management
Notification tokens storage
Drafted statuses support
User alt-text preferences

## Content Filters
### Content Moderation & Filtering
Keyword Filtering: Block posts containing specific keywords across different timeline types (hashtag, text, or both)
Hashtag Filtering: Filter content based on hashtags with exact matching
Account Banning: Automatically ban accounts based on username, display name, or bio content matching filter keywords
Status Banning: Automatically mark statuses as banned and sensitive when they match filter criteria
Tag Banning: Automatically mark tags as non-listable and non-trendable when they match filters
Spam Detection: Separate spam filters with dedicated detection and blocking capabilities
Real-time Processing: Background workers continuously monitor and apply filters to new content
### Federation Controls
Threads Integration: Block or unblock posts from Threads from appearing in timelines
Bluesky Integration: Control Bluesky post visibility in your server's feeds
Domain Filtering: Filter statuses based on server settings and federation policies
Cross-platform Content Management: Fine-grained control over federated content
### Community Channel Automation
Automated Reblogging: Automatically boost posts to community channels based on filter rules
Newsmast Bot Integration: Support for Newsmast-specific boosting via Lambda service
Custom Channel Support: Configure boost behavior for custom community channels
Group Channel Management: Manage group channels with automated boosting
Filter-based Boosting: Only boost posts that pass community-specific keyword filters
### Advanced Search Capabilities
Account Search Enhancement: Enhanced account search with is_banned filtering
Banned Content Exclusion: Search results automatically exclude banned accounts and statuses
Following Network Search: Advanced search for accounts within your following network
Elasticsearch Integration: Custom Chewy indices for accounts, statuses, and public statuses
🔧 Filter Management
Global Filters: Server-wide keyword filters that apply to all users
Community Filters: Community-specific filters with filter-in and filter-out support
Filter Types: Support for hashtag-only, text-only, or combined filtering
Redis Caching: Efficient filter caching with 24-hour expiration
Multiple Filter Sources: Combine ContentFilters::KeywordFilter and ContentFilters::CommunityFilterKeyword
### Performance Optimizations
Batch Processing: Process accounts, statuses, and tags in configurable batches (default 1000)
Redis Integration: Fast banned content ID lookups using Redis sorted sets
Database Read Replicas: Support for read replica routing for heavy queries
Selective Column Loading: Load only necessary columns for better performance
Progress Tracking: Real-time progress logging during batch operations
### Timeline Filtering
Home Timeline Filtering: Filter home feed based on content filters and server settings
Public Timeline Filtering: Enhanced public feed with reblog and reply filtering options
Excluded Status IDs: Maintain separate Redis sets for content filters and spam filters
Direct Status Exclusion: Option to exclude direct messages from timelines
Followed Tags Filtering: Control visibility of posts from followed hashtags
Reply Filtering: Option to exclude replies from feed
### Feed Service Integration
Server Setting Aware: Automatically apply filters based on server configuration
Federation Filtering: Filter content based on Threads and Bluesky server settings
Dynamic Filter Application: Apply content filters and spam filters independently or together
Cache Management: Efficient banned status ID management in Redis

## Custom Feeds
Redis-backed Custom Feeds: Per-account custom timelines stored in Redis with automatic trimming
Push/Unpush Operations: Add or remove statuses from custom timelines
Timeline Population: Build custom timelines from scratch using populate_custom
Merge/Unmerge Support: Merge or remove an account's statuses from another account's custom timeline

## Posts
### Post Management
Custom Character Limits: Configure custom character limits per instance through server settings (default: 500 characters)
Draft Status Management: Create, update, publish, and delete draft posts with full API support
Scheduled Posts: Extended scheduled status management with custom parameters
Quote Posts: Support for quoting other posts with visibility inheritance
Reply Threading: Enhanced reply management with thread validation
### Media & Content Enhancement
Automatic ALT Text Generation: AI-powered automatic ALT text generation for images using external API integration
Link Preview Generation: Automatic link thumbnail generation with customizable metadata extraction
Media Attachment Management: Support for multiple image formats (JPEG, PNG, GIF, WebP, BMP) with validation
Draft Media Association: Media attachments can be associated with draft statuses
### Notification Enhancements
Direct Mention Filtering: Filter notifications to show only direct mentions
Private Mention Exclusion: Option to exclude private/direct mentions from notification lists
Grouped Notifications: Enhanced notification grouping with custom type support
Extended Notification API: V1 and V2 API enhancements for better filtering
### Automation & Integration
Post Boosting: Automatic post boosting to external instances with worker support
Relay Management: Create and delete relay connections for federated content
Custom Timeline Filtering: Extended account status filtering with multiple exclusion options
Boost Channel Management: Special handling for boost bot accounts
