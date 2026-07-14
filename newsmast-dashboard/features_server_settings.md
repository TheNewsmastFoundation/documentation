# Server settings

> **Dependency:** Newsmast Dashboard is **Required** to manage Dashboard setting records. Host Mastodon/Newsmast Mastodon support is **Required** to apply relevant behavior. Mechanisms: **shared database**, **Patchwork Hub API**, and **Redis/Sidekiq**.

Use Server Settings to manage the available feature groups, including automatic search opt-in, long posts, local-only posts, content/spam filters, Bluesky bridge automation, and email branding. The settings are hierarchical: child setting changes can synchronize to Patchwork Hub when configured.

The Dashboard owns the data and administration workflow. The host Mastodon application and Newsmast Mastodon extension own the matching runtime behavior. A setting saved in the Dashboard should therefore be verified in the target host experience.

Read [configuration](configuration.md), the [technical settings reference](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/features/server-settings.md), and related [Newsmast Mastodon post features](../newsmast-mastodon/features_posts.md).