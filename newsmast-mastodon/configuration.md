# Newsmast Mastodon Plugin configuration

## Accounts Management
See 

### Account

- `AUTO_FOLLOW_ENABLED` - Enable auto-follow on signup (`true` or `false`, defaults to disabled)
- `AUTO_FOLLOW_ACCOUNTS` - Comma-separated list of account handles to auto-follow after signup
- `WELCOME_EMAIL_DISABLED` - Disable welcome email sent to new users after signup (set to `true` to disable, defaults to enabled)

### Push Notifications

- `FIREBASE_PROJECT_ID` - Firebase project ID for FCM push notifications (required for push notifications to work)
- `FIREBASE_KEY_FILE_NAME` - Path to Firebase service account JSON key file (required for push notifications to work)
- `NOTIFICATION_SENDER_NAME` - App name displayed in push notification titles (defaults to `Development Patchwork`)

### Email Configuration

- `MAIL_SENDER_NAME` - Name used as sender for all outgoing emails (defaults to `Development Patchwork`)
- `MAIL_LOGO_URL` - Default URL for logo image in email templates (defaults to Patchwork demo logo)
- `IOS_APP_STORE_URL` - URL to iOS app in App Store; when set, displays app store link in email footer
- `ANDROID_APP_STORE_URL` - URL to Android app in Google Play; when set, displays app store link in email footer
- `PRIVACY_POLICY_URL` - URL to privacy policy; when set along with `TERMS_AND_CONDITIONS_URL`, displays policy links in email footer
- `TERMS_AND_CONDITIONS_URL` - URL to terms of service; when set along with `PRIVACY_POLICY_URL`, displays policy links in email footer

### User Preferences

- `DEFAULT_EMAIL_NOTIFICATIONS_ENABLED` - Default email notification state for new users (`true` or `false`)
- `DASHBOARD_INSTANCE_URL` - Mastodon connected Dashboard URL

### Ghost Integration (Optional)

- `GHOST_URL` - Base URL of Ghost CMS instance (required only if using Ghost subscriptions feature, e.g., `https://newsletter.example.com`)
- `GHOST_ADMIN_API_KEY` - Ghost Admin API key in format `id:secret` for authentication (required only if using Ghost subscriptions feature)

## Content Filters
### Environment Variables
- `LOCAL_DOMAIN` - Your Mastodon server's domain (required for reblog operations)
- `MAIN_CHANNEL` - Enable/disable main channel reblogging functionality
- `BOOST_BOT_ENABLED` - Enable/disable automated boost bot
- `BOOST_COMMUNITY_BOT_URL` - URL for Newsmast bot Lambda service
- `BOOST_COMMUNITY_BOT_API_KEY` - API key for Newsmast bot authentication

### Database Migrations
The gem adds the following database columns:
- `accounts.is_banned` - Boolean flag for banned accounts (default: false)
- `statuses.is_banned` - Boolean flag for banned statuses (default: false)

### Redis Keys
The gem uses the following Redis keys:
- `excluded_status_ids` - Combined banned status IDs (content + spam filters)
- `content_filters_banned_status_ids` - Status IDs banned by content filters
- `spam_filters_banned_status_ids` - Status IDs banned by spam filters
- `spam_filters` / `channel:spam_filters` - Hash of spam filter configurations
- `content_filters` / `channel:content_filters` - Hash of content filter configurations


## Custom Feeds
```Redis-backed Custom Feeds: Per-account custom timelines stored in Redis with automatic trimming
Push/Unpush Operations: Add or remove statuses from custom timelines
Timeline Population: Build custom timelines from scratch using populate_custom
Merge/Unmerge Support: Merge or remove an account's statuses from another account's custom timeline```

## Posts

### ALT Text Generation
- `ALT_TEXT_ENABLED` - Enable/disable automatic ALT text generation (`true`/`false`)
- `ALT_TEXT_URL` - Base URL for ALT text API service
- `ALT_TEXT_SECRET` - API key for ALT text service authentication
- `ALT_TEXT_USER_TOGGLE` - Require user opt-in for ALT text generation (`true`/`false`)

### Post Boosting
- `BOOST_POST_ENABLED` - Enable/disable automatic post boosting (`true`/`false`)
- `BOOST_POST_INSTANCE_URL` - Target instance URL for boosting posts
- `BOOST_POST_API_KEY` - API key for boost service authentication
- `BOOST_POST_API_SECRET` - API secret for boost service authentication
- `BOOST_POST_USERNAME` - Username for boost service account
- `BOOST_POST_USER_DOMAIN` - Domain for boost service account
