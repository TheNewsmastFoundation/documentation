# Integrations

> **Dependency:** External integrations are **Optional** unless you enable the matching feature. Newsmast Mastodon is **Not required** for standard Dashboard-to-Mastodon REST calls, but is **Required** for gem-owned extensions. Mechanisms: **Mastodon REST API**, **Patchwork Hub API**, and **external service**.

Newsmast Dashboard can use Mastodon application credentials, Patchwork Hub synchronization, Bluesky/Bridgy Fed, DNS-provider automation, relay services, and S3-compatible object storage. Configure only the services required for your deployment and test them independently.

Ghost, WordPress, Firebase, CiviCRM, drafts, reactions, ALT-text generation, and other gem-owned integrations are not Dashboard configuration features. Consult the [Newsmast Mastodon integrations guide](../newsmast-mastodon/features_integrations.md) for those services.

Use [configuration](configuration.md) for operator setup and the [technical integrations reference](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/features/integrations.md) for verified dependencies and failure behavior.