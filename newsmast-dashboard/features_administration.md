# Administration

> **Dependency:** Newsmast Dashboard is **Required** for its administration workflows. Mastodon access is **Required** for account-facing operations. Mechanisms: **Mastodon REST API**, **OAuth/Doorkeeper**, and **shared database**.

Dashboard administrators can manage accounts and follows, master administrators, roles, community administrators, wait lists, API keys, custom emoji, app versions, collections, and exports. Community administrators can be associated with channels and configured as active boost bots.

Dashboard browser access is controlled by the Dashboard's authentication and authorization policies. Sidekiq access is limited to authorized users. Treat Dashboard API keys, Mastodon credentials, and administrator passwords as secrets.

For API authentication, role boundaries, and technical details, read the [administration reference](https://github.com/patchwork-hub/patchwork_dashboard/blob/main/docs/features/administration.md) and [Dashboard API reference](https://github.com/patchwork-hub/patchwork_dashboard/blob/main/docs/api/dashboard-api.md).