# Newsmast Mastodon Plugin Integrations

This document covers the plugin's integrations with external services and the Newsmast mobile apps: content webhooks (Ghost and WordPress), mobile deep linking, and CiviCRM membership verification.

For the related environment variables, see [configuration.md](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md).

## Content Webhooks

The plugin can receive webhooks from external content platforms to notify subscribers when new content is published. When a webhook host (`GHOST_URL` or `WORDPRESS_URL`) is configured, the engine automatically adds it to the host application's allowed hosts.

### Ghost CMS

- **Purpose**: Notify subscribers when a Ghost newsletter or post is published.
- **Setup**: Configure `GHOST_URL`, `GHOST_ADMIN_API_KEY`, and the webhook variables (`GHOST_WEBHOOK_ID`, `GHOST_WEBHOOK_TARGET_URL`, `GHOST_WEBHOOK_SECRET`). Register the target URL as a webhook in your Ghost integration settings.
- **Verification**: Incoming requests are verified against `GHOST_WEBHOOK_SECRET`.

```
POST /api/v1/ghost_webhooks   # Handle a Ghost CMS content update
```

Related account endpoint for managing a user's Ghost subscription:

```
POST /api/v1/accounts/subscribe_leicester   # Manage a Ghost subscription for the account
```

### WordPress

- **Purpose**: Notify subscribers when a WordPress post is published.
- **Setup**: Configure `WORDPRESS_URL`. Register the webhook endpoint in your WordPress installation.

```
POST /api/v1/wordpress_webhooks   # Handle a WordPress content update
```

Content notifications are dispatched asynchronously via background workers (`GhostNotificationWorker`, `ArticleNotificationWorker`).

## Mobile Deep Linking

The plugin serves the well-known association files required for iOS Universal Links and Android App Links, so the Newsmast mobile apps can open profile and status URLs directly.

```
GET /.well-known/apple-app-site-association   # iOS Universal Links (AASA)
GET /.well-known/assetlinks.json              # Android App Links
```

These endpoints require no authentication.

- **iOS**: Set `IOS_APP_ID` (in `TeamID.BundleID` format) and, optionally, `IOS_DEEPLINK_PATHS`. The AASA endpoint returns 404 until `IOS_APP_ID` is set.
- **Android**: Set `ANDROID_PACKAGE_NAME` and `ANDROID_SHA256_CERT_FINGERPRINTS`. The asset links endpoint returns 404 until both are set.

See the [Deep Linking configuration](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md#deep-linking) for variable details.

## CiviCRM Membership Check

The plugin can gate sign-in behind an active CiviCRM membership, allowing organisations to restrict access to verified members.

- **Purpose**: Verify that a user has an active membership in a CiviCRM instance during authentication.
- **Setup**: Set `CSID_MEMBERSHIP_CHECK_ENABLED=true`, `CIVICRM_BASE_URL`, and `CIVICRM_AUTH_TOKEN`.
- **Allowlist**: Use `CSID_MEMBERSHIP_ALLOWLIST_EMAILS` to exempt specific accounts (for example, admins) from the membership check.

When enabled, membership is verified via the `CiviCRMMembershipCheckService` during the authentication flow. See the [CiviCRM configuration](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md#civicrm-membership-check-optional) for variable details.
