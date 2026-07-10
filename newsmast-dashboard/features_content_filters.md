# Content filters

> **Dependency:** Newsmast Dashboard is **Required** to manage Dashboard filter groups and community filter keywords. Newsmast Mastodon is **Required** to enforce supported filtering. Mechanisms: **shared database**, **Patchwork Hub API**, and **Redis/Sidekiq**.

Use the Dashboard to create global keyword-filter groups, activate/deactivate groups, manage individual keywords, and set channel filter-in/filter-out rules. When Patchwork Hub is configured, the Dashboard can synchronize Hub-managed non-custom groups.

Turning the content or spam filter setting on refreshes the corresponding Dashboard filter data. The Dashboard manages the configuration; Newsmast Mastodon owns supported timeline/filter enforcement and Redis-backed runtime behavior. Check both applications and Redis when a filter is not effective.

Configure Hub and Redis as described in [configuration](configuration.md). Read the [technical filter reference](https://github.com/patchwork-hub/patchwork_dashboard/blob/main/docs/features/content-filters.md) and the related [Newsmast Mastodon guide](../newsmast-mastodon/features_content_filters.md).