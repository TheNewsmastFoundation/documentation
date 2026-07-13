# Channels

> **Dependency:** Newsmast Dashboard is **Required** to create and manage channel definitions. Newsmast Mastodon is **Required** for gem-backed custom feeds and supported automation. Mechanisms: **shared database**, **Mastodon REST API**, and **Redis/Sidekiq**.

Use the Dashboard's Channels area to create channels, choose a type, add presentation details, configure hashtags and post types, add contributors, and assign channel administrators or boost bots. Manage visibility, collections, starter-pack data, rules, links, and additional information from the channel workflow.

The Dashboard stores channel and administrator data. Newsmast Mastodon consumes supported records to expose custom feeds and starter packs; it also provides related runtime behavior. A saved Dashboard channel does not itself create a feed when the host gem support is absent.

Use the [technical channels reference](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/features/channels.md) for endpoints, recovery/upgrade operations, and detailed permissions. See the related [Newsmast Mastodon custom-feeds guide](../newsmast-mastodon/features_custom_feeds.md).