# Customizing Newsmast

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

### Custom Relay & Instances Timeline (Optional)

- `CUSTOM_RELAY_DOMAINS` - Comma-separated source instance domains to subscribe to via FediBuzz relay endpoints (e.g., `mastodon.social,mastodon.beer`). Powers the instances timeline endpoint.

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

When you install the admin dashboard, you'll need to set these environment variables as part of your server configuration or by copying the `.env.sample` [[link]] file over to `.env` and modifying accordingly. You can find additional instructions for determining some of these variables within the `.env.sample` file.

## Rails Runtime

- `RAILS_ENV`, `RAILS_SERVE_STATIC_FILES`, `SECRET_KEY_BASE` - Common settings used to configure Rails application at boot
- `PORT`, `EXTERNAL_PORT` - The server localhost port (for Docker setup, `EXTERNAL_PORT` should match `PORT`)
- `STATIC_TOKEN` API bearer-token validation for selected endpoints

## Admin Credentials

Please ensure the following credentials are unique and a user with these credentials does _not_ exist in your Mastodon instance.

`MASTER_ADMIN_USERNAME` - Username of the dashboard admin user
`MASTER_ADMIN_EMAIL` - Email address of the admin user
`MASTER_ADMIN_PASSWORD` - Password of the admin user

## Mastodon Connection

Obtain these variables from your Mastodon instance under "Development" settings. Create a new application with the following scopes: `read`, `profile`, `write`, `follow`, `push`.

- `LOCAL_DOMAIN` - This should match the domain you set for `LOCAL_DOMAIN` when creating your Mastodon instance
- `MASTODON_INSTANCE_URL` - The public web address for your Mastodon instance
- `MASTODON_APPLICATION_TOKEN` - Your dev application access token
- `MASTODON_CLIENT_ID` - Your  dev application client key
- `MASTODON_CLIENT_SECRET` - Your  dev application client secret

## Database Connection

Your Mastodon instance and the admin dashboard are dependent on a single database.

- `DB_HOST, DB_NAME, DB_USER, DB_PASS, DB_PORT, DB_POOL` - You can copy these environment variables from your Mastodon server configuration
- `MAX_THREADS`, `DB_SSLMODE`, `PREPARED_STATEMENTS` - Advanced DB settings as used in ActiveRecord config

<!--  `DB_READ_ONLY_USER`, `DB_READ_ONLY_PASS`, `DB_HOST_REPLICA` …why are these in only the staging environment in config/database.yml ? -->

## Redis Connection

Your Mastodon instance and the admin dashboard can share the same Redis server.

- `REDIS_HOST`, `REDIS_PORT`, `REDIS_PASSWORD` - You can copy these environment variables from your Mastodon server configuration
- `REDIS_NAMESPACE` - Use a unique namespace for some settings storage (defaults to `dashboard`)
- `REDIS_DB` - Database name to use within Redis
- `SIDEKIQ_REDIS_DB` - Optional, will override the `REDIS_DB` variable for Sidekiq if set

## Features

Aspects of this functionality is also managed by the [[newsmast-mastodon]] plugin gem.

`CHANNELS_ENABLED` - Enable custom Channels support (`true` or `false`, defaults to disabled)
`CHANNEL_POST_HASHTAG_ENABLED` - Enable post hashtag management for Channels (`true` or `false`, defaults to disabled)
`NEWSMAST_POST_HASHTAG_ENABLED` - Enable post hashtag management for Newsmast Channels (`true` or `false`, defaults to disabled)
`PATCHWORK_HUB_URL` - To connect with Patchwork Hub for Spam Block and Content Moderation services, plus settings synchronization. API credentials are managed in the Dashboard API-key interface

## Service Integrations

### Email Notifications

Used for Action Mailer for admin alerts and user invites. You might look into copying these over from your Mastodon server configuration.

`SMTP_SERVER` - Server address for your SMTP server
`SMTP_PORT` - SMTP port number (defaults to `587`)
`SMTP_LOGIN, SMTP_PASSWORD` - SMTP access credentials
`SMTP_DOMAIN` - Domain name of the "from" email addresses

### S3-Compatible Object Storage Configuration

Configure your S3-compatible object storage for file storage (e.g., AWS S3, DigitalOcean Spaces). You might look into copying these environment variables from your Mastodon server configuration.

- `S3_ENABLED` - Enable/disable S3 storage (`true`/`false`, defaults to disabled)
- `S3_REGION, S3_BUCKET, S3_ALIAS_HOST, S3_ENDPOINT` - These are provided by your S3-compatible service after bucket is created
- `AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY` - S3-compatible access credentials

### DNS Configuration

Configure your DNS provider credentials for automatic DNS record management. This is required when you want Newsmast to set up domain-based bridged handles on Bluesky (`USE_LOCAL_DOMAIN=true`), rather than the default handles provided by [Bridgy Fed](https://fed.brid.gy/). Route 53 is the only DNS service supported out of the box.

- `USE_LOCAL_DOMAIN` - When `true` (default), sets up bridged handles like `@username.yourdomain.com`, otherwise `@username.yourdomain.com.ap.brid.gy`.

<!-- ^ This explanation is reversed in .env.sample, I'm assuming the "Bluesky Bridge Handle Configuration" docs page was correct although it still gets the ATProto handles wrong (they're not @user@domain like ActivityPub) -->

- `AWS_ACCESS_DNS_RESOLVE_ID, AWS_SECRET_DNS_RESOLVE_KEY, AWS_DNS_REGION` - These access credentials are provided by Route53.

> Note: [[You could write your own DNS service integration]], in which case you can choose a different value for `DNS_PROVIDER` env var than the default `route53`.
