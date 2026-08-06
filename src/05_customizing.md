# Customizing

Newsmast makes a number of customization options available by setting environment variables. Here's a guide to making the system work for you. Be sure to read [[Getting the Lay of the Land]] first so you understand more about the various features mentioned.

> [!NOTE]
> All variables are optional unless noted otherwise.

The following variables would need to be set on the server where your Mastodon instance (and `newsmast-mastodon`) is installed.

## General

`LOCAL_DOMAIN` - Domain for the Mastodon instance (for example: `example.social`). Used for deep links, channel detection, and reblog operations.

## Accounts Management

- `AUTO_FOLLOW_ENABLED` - Enable auto-follow behavior for newly registered users (`true` or `false`, defaults to disabled)
- `AUTO_FOLLOW_ACCOUNTS` - Comma-separated list of account handles to auto-follow after user registration
- `WELCOME_EMAIL_DISABLED` - Disable welcome email for newly registered users (set to `true` to disable, defaults to enabled)

## Enhancements to Posting

See [[Integrations]] below for some additional post-related functionality such as automatic alt-text generation and automatic post boosting.

## Channels & Feeds

- `MAIN_CHANNEL` - Enable/disable main channel reblogging functionality
- `BOOST_BOT_ENABLED` - Enable/disable automated boost bot
- `BOOST_COMMUNITY_BOT_URL` - URL for Newsmast bot Lambda service
- `BOOST_COMMUNITY_BOT_API_KEY` - API key for Newsmast bot authentication
- `REBLOG_ENABLED` - Enable reblog functionality (set to `true` to enable)
- `REBLOG_INSTANCE_URL` - Mastodon instance URL used for reblog operations
- `REBLOG_EMAIL` - Email account used for reblog authentication
- `REBLOG_PASSWORD` - Password used for reblog authentication
- `REBLOG_CLIENT_ID` - OAuth client ID for the reblog instance (required if reblog enabled)
- `REBLOG_CLIENT_SECRET` - OAuth client secret for the reblog instance (required if reblog enabled)

## Deep Linking (for mobile apps)

- `IOS_APP_ID` - Full iOS app identifier in `TeamID.BundleID` format (required for iOS; the AASA endpoint returns 404 if unset)
- `IOS_DEEPLINK_PATHS` - Comma-separated URL path patterns (defaults to `/@*,/@*/*`)
- `ANDROID_PACKAGE_NAME` - Android app package name (required for Android; the asset links endpoint returns 404 if unset)
- `ANDROID_SHA256_CERT_FINGERPRINTS` - Comma-separated SHA-256 certificate fingerprints for Android app verification (required for Android)

## Integrations

The following integrations can be set up as part of the `newsmast_mastodon` installation. There are a few additional integrations requiring a `newsmast-dashboard` installation as well (see below).

### Push Notifications

- `FIREBASE_PROJECT_ID` - Firebase project ID for FCM push notifications (required for push notifications to work)
- `FIREBASE_KEY_FILE_NAME` - Path to Firebase service account JSON key file (required for push notifications to work)
- `NOTIFICATION_SENDER_NAME` - App name displayed in push notification titles (defaults to `Development Patchwork`)
- `SKIP_SIGNUP_PUSH_NOTI` - Skip sending push notifications on signup (set to `true` to skip)
- `ARTICLE_NOTIFICATION_SENDER_NAME` - Sender name for article notifications (defaults to `Development Patchwork`)

### Email Notifications & Branding

- `MAIL_SENDER_NAME` - Name used as sender for all outgoing email notifications (defaults to `Development Patchwork`)
- `MAIL_LOGO_URL` - URL for logo image in email templates (defaults to Patchwork demo logo)
- `DEFAULT_EMAIL_NOTIFICATIONS_ENABLED` - Default email notification state for new users (`true` or `false`)
- `IOS_APP_STORE_URL` - URL to iOS app in App Store; when set, displays app store link in email footer
- `ANDROID_APP_STORE_URL` - URL to Android app in Google Play; when set, displays app store link in email footer
- `PRIVACY_POLICY_URL` - URL to privacy policy; when set along with `TERMS_AND_CONDITIONS_URL`, displays policy links in email footer
- `TERMS_AND_CONDITIONS_URL` - URL to terms of service; when set along with `PRIVACY_POLICY_URL`, displays policy links in email footer

### CiviCRM Membership Check (Optional)

Add this integration when you need to restrict user access to verified members of a CiviCRM instance. You can except specific accounts (such as admins) from the auth restriction.

- `CSID_MEMBERSHIP_CHECK_ENABLED` - Enable CiviCRM membership verification (`true` or `false`, defaults to disabled)
- `CIVICRM_BASE_URL` - Base URL for the CiviCRM instance (required if enabled, e.g., `https://civicrm.example.com`)
- `CIVICRM_AUTH_TOKEN` - CiviCRM API authentication token (required if enabled; a `Bearer` prefix is added automatically if omitted)
- `CSID_MEMBERSHIP_ALLOWLIST_EMAILS` - Comma-separated email addresses that bypass the CiviCRM membership check

### Ghost Integration (Optional)

Add this integration to notify subscribers when a Ghost newsletter or post is published.

- `GHOST_URL` - Base URL of Ghost CMS instance (required only if using Ghost subscriptions feature, e.g., `https://newsletter.example.com`)
- `GHOST_ADMIN_API_KEY` - Ghost Admin API key in format `id:secret` for authentication (required only if using Ghost subscriptions feature)
- `GHOST_WEBHOOK_ID` - Ghost webhook ID used for incoming update callbacks
- `GHOST_WEBHOOK_TARGET_URL` - Target URL registered for Ghost webhook callbacks
- `GHOST_WEBHOOK_SECRET` - Secret token used to verify incoming Ghost webhooks
- `GHOST_NOTIFICATION_SENDER_NAME` - Sender name for Ghost-related notifications (defaults to `Development Patchwork`)

### WordPress Integration (Optional)

Add this integration to notify subscribers when a WordPress post is published.

- `WORDPRESS_URL` - WordPress instance URL (automatically added to the host's allowed hosts when set)

<!-- add more info to set up the webhook… -->

<!-- Dashboard-owned Bluesky/DNS, Patchwork Hub, relay-operation, and storage workflows will need to be documented separately -->

### Custom Relay & Instances Timeline (Optional)

- `CUSTOM_RELAY_DOMAINS` - Comma-separated source instance domains to subscribe to via FediBuzz relay endpoints (e.g., `mastodon.social,mastodon.beer`). Powers the instances timeline endpoint. See [[Custom Feeds]]

### Post Enhancements

Server-level settings such as long-post limits and local-only post availability are managed in the Newsmast Dashboard. The variables below configure optional external services used by the gem.

> **Note:** Automatic ALT text generation currently supports [alttext.ai](https://alttext.ai/) only. Set `ALT_TEXT_URL` to the alttext.ai API endpoint and `ALT_TEXT_SECRET` to your alttext.ai API key.

- `ALT_TEXT_ENABLED` - Enable/disable automatic ALT text generation (`true`/`false`)
- `ALT_TEXT_URL` - Base URL for ALT text API service (only [alttext.ai](https://alttext.ai/) is currently supported)
- `ALT_TEXT_SECRET` - API key for ALT text service authentication
- `ALT_TEXT_USER_TOGGLE` - Require user opt-in for ALT text generation when `true`, unless `SKIP_ALT_TEXT_USER_SETTING` is enabled
- `SKIP_ALT_TEXT_USER_SETTING` - Bypass the per-user alt text setting when `true`; this takes precedence over `ALT_TEXT_USER_TOGGLE`.

<!-- Q: What is the boost service? And how is this different form BOOST_BOT stuff above? -->

- `BOOST_POST_ENABLED` - Enable/disable automatic post boosting (`true`/`false`)
- `BOOST_POST_INSTANCE_URL` - Target instance URL for boosting posts
- `BOOST_POST_API_KEY` - API key for boost service authentication
- `BOOST_POST_API_SECRET` - API secret for boost service authentication
- `BOOST_POST_USERNAME` - Username for boost service account
- `BOOST_POST_USER_DOMAIN` - Domain for boost service account

## Dashboard Environment Variables

...

<!-- to fill in -->
