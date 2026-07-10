# Newsmast Mastodon Plugin configuration

This page is a user-facing summary of the most common environment variables for operating the plugin. For the complete, exhaustive list of every supported variable (including advanced and rarely-changed options), see the gem's reference: [docs/configuration/environment-variables.md](https://github.com/TheNewsmastFoundation/newsmast-mastodon/blob/main/docs/configuration/environment-variables.md).

All variables are optional unless noted otherwise.

## Accounts Management

### Account

- `AUTO_FOLLOW_ENABLED` - Enable auto-follow on signup (`true` or `false`, defaults to disabled)
- `AUTO_FOLLOW_ACCOUNTS` - Comma-separated list of account handles to auto-follow after signup
- `WELCOME_EMAIL_DISABLED` - Disable welcome email sent to new users after signup (set to `true` to disable, defaults to enabled)

### Push Notifications

- `FIREBASE_PROJECT_ID` - Firebase project ID for FCM push notifications (required for push notifications to work)
- `FIREBASE_KEY_FILE_NAME` - Path to Firebase service account JSON key file (required for push notifications to work)
- `NOTIFICATION_SENDER_NAME` - App name displayed in push notification titles (defaults to `Development Patchwork`)
- `SKIP_SIGNUP_PUSH_NOTI` - Skip sending push notifications on signup (set to `true` to skip)
- `ARTICLE_NOTIFICATION_SENDER_NAME` - Sender name for article notifications (defaults to `Development Patchwork`)

### Email Configuration

- `MAIL_SENDER_NAME` - Name used as sender for all outgoing emails (defaults to `Development Patchwork`)
- `MAIL_LOGO_URL` - Default URL for logo image in email templates (defaults to Patchwork demo logo)
- `IOS_APP_STORE_URL` - URL to iOS app in App Store; when set, displays app store link in email footer
- `ANDROID_APP_STORE_URL` - URL to Android app in Google Play; when set, displays app store link in email footer
- `PRIVACY_POLICY_URL` - URL to privacy policy; when set along with `TERMS_AND_CONDITIONS_URL`, displays policy links in email footer
- `TERMS_AND_CONDITIONS_URL` - URL to terms of service; when set along with `PRIVACY_POLICY_URL`, displays policy links in email footer

### User Preferences

- `DEFAULT_EMAIL_NOTIFICATIONS_ENABLED` - Default email notification state for new users (`true` or `false`)
- `DASHBOARD_INSTANCE_URL` - URL of the Newsmast Dashboard connected to the Mastodon server

### CiviCRM Membership Check (Optional)

- `CSID_MEMBERSHIP_CHECK_ENABLED` - Enable CiviCRM membership verification (`true` or `false`, defaults to disabled)
- `CIVICRM_BASE_URL` - Base URL for the CiviCRM instance (required if enabled, e.g., `https://civicrm.example.com`)
- `CIVICRM_AUTH_TOKEN` - CiviCRM API authentication token (required if enabled; a `Bearer` prefix is added automatically if omitted)
- `CSID_MEMBERSHIP_ALLOWLIST_EMAILS` - Comma-separated email addresses that bypass the CiviCRM membership check

### Ghost Integration (Optional)

- `GHOST_URL` - Base URL of Ghost CMS instance (required only if using Ghost subscriptions feature, e.g., `https://newsletter.example.com`)
- `GHOST_ADMIN_API_KEY` - Ghost Admin API key in format `id:secret` for authentication (required only if using Ghost subscriptions feature)
- `GHOST_WEBHOOK_ID` - Ghost webhook ID used for incoming update callbacks
- `GHOST_WEBHOOK_TARGET_URL` - Target URL registered for Ghost webhook callbacks
- `GHOST_WEBHOOK_SECRET` - Secret token used to verify incoming Ghost webhooks
- `GHOST_NOTIFICATION_SENDER_NAME` - Sender name for Ghost-related notifications (defaults to `Development Patchwork`)

See [Integrations](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_integrations.md) for Ghost and WordPress webhook setup.

### WordPress Integration (Optional)

- `WORDPRESS_URL` - WordPress instance URL (automatically added to the host's allowed hosts when set)

## Content Filters

Global and community keyword rules, spam filters, federation controls, and their server-level toggles are managed in the Newsmast Dashboard. The variables below configure the gem-side reblog and boost services that act on dashboard-managed community data. See [Content Filters](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_content_filters.md) for the feature workflow.

- `LOCAL_DOMAIN` - Your Mastodon server's domain (required for reblog operations)
- `MAIN_CHANNEL` - Enable/disable main channel reblogging functionality
- `BOOST_BOT_ENABLED` - Enable/disable automated boost bot
- `BOOST_COMMUNITY_BOT_URL` - URL for Newsmast bot Lambda service
- `BOOST_COMMUNITY_BOT_API_KEY` - API key for Newsmast bot authentication

### Reblog Services
- `REBLOG_ENABLED` - Enable reblog functionality (set to `true` to enable)
- `REBLOG_INSTANCE_URL` - Mastodon instance URL used for reblog operations
- `REBLOG_EMAIL` - Email account used for reblog authentication
- `REBLOG_PASSWORD` - Password used for reblog authentication
- `REBLOG_CLIENT_ID` - OAuth client ID for the reblog instance (required if reblog enabled)
- `REBLOG_CLIENT_SECRET` - OAuth client secret for the reblog instance (required if reblog enabled)

### Custom Relay & Instances Timeline
- `CUSTOM_RELAY_DOMAINS` - Comma-separated source instance domains to subscribe to via FediBuzz relay endpoints (e.g., `mastodon.social,mastodon.beer`). Powers the instances timeline endpoint. See [Custom Feeds](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_custom_feeds.md).

## Deep Linking

Used by the well-known deep link endpoints for the Newsmast mobile apps. See [Integrations](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_integrations.md).

- `IOS_APP_ID` - Full iOS app identifier in `TeamID.BundleID` format (required for iOS; the AASA endpoint returns 404 if unset)
- `IOS_DEEPLINK_PATHS` - Comma-separated URL path patterns (defaults to `/@*,/@*/*`)
- `ANDROID_PACKAGE_NAME` - Android app package name (required for Android; the asset links endpoint returns 404 if unset)
- `ANDROID_SHA256_CERT_FINGERPRINTS` - Comma-separated SHA-256 certificate fingerprints for Android app verification (required for Android)

## Posts

Server-level settings such as long-post limits and local-only post availability are managed in the Newsmast Dashboard. The variables below configure optional external services used by the gem.

### ALT Text Generation

> **Note:** Automatic ALT text generation currently supports [alttext.ai](https://alttext.ai/) only. Set `ALT_TEXT_URL` to the alttext.ai API endpoint and `ALT_TEXT_SECRET` to your alttext.ai API key.

- `ALT_TEXT_ENABLED` - Enable/disable automatic ALT text generation (`true`/`false`)
- `ALT_TEXT_URL` - Base URL for ALT text API service (only [alttext.ai](https://alttext.ai/) is currently supported)
- `ALT_TEXT_SECRET` - API key for ALT text service authentication
- `ALT_TEXT_USER_TOGGLE` - Require user opt-in for ALT text generation (`true`/`false`)

### Post Boosting
- `BOOST_POST_ENABLED` - Enable/disable automatic post boosting (`true`/`false`)
- `BOOST_POST_INSTANCE_URL` - Target instance URL for boosting posts
- `BOOST_POST_API_KEY` - API key for boost service authentication
- `BOOST_POST_API_SECRET` - API secret for boost service authentication
- `BOOST_POST_USERNAME` - Username for boost service account
- `BOOST_POST_USER_DOMAIN` - Domain for boost service account

