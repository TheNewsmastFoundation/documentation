# Newsmast Dashboard configuration

Use the Dashboard repository's [environment-variable reference](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/configuration/environment-variables.md) as the canonical setting-by-setting source. Copy the sample environment file, use protected secret storage, and never publish credential values.

## Required groups

- Rails runtime and published port.
- Host Mastodon identity and application credentials.
- Shared Mastodon PostgreSQL connection.
- Redis/Sidekiq connection.
- Master-administrator and Rails/API secrets.

## Conditional groups

- Patchwork Hub URL and Dashboard API credentials for Hub synchronization.
- S3-compatible object storage for uploads.
- Bluesky/Bridgy Fed and DNS-provider credentials for bridge provisioning.
- Channel feature toggles.

The Dashboard owns its runtime configuration. Use the [Newsmast Mastodon configuration guide](../newsmast-mastodon/configuration.md) only for gem-owned runtime behavior. Database and Redis connectivity remain shared deployment responsibilities.