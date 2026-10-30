# Newsmast Dashboard

Newsmast Dashboard is the administrative application for a Newsmast/Mastodon deployment. The [`newsmast-dashboard`](https://github.com/TheNewsmastFoundation/newsmast-dashboard) repository is the technical source of truth. The former `patchwork_dashboard` name remains in some implementation and deployment identifiers. The Dashboard is a separate Rails application, not a direct Newsmast Mastodon gem dependency.

## Prerequisites and compatibility

Install against an already-running, compatible Mastodon deployment with reachable PostgreSQL and Redis. The Dashboard needs Mastodon application credentials and access to the shared services. Follow the technical source repository for exact supported deployment details and release information: [Newsmast Dashboard releases](https://github.com/TheNewsmastFoundation/newsmast-dashboard/releases).

## Install and update

- [Source installation](https://github.com/TheNewsmastFoundation/newsmast-dashboard#installation-and-development)
- [Docker installation](docker_install.md)
- [Technical configuration reference](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/configuration/environment-variables.md)

Run Dashboard migrations in its deployment after updating it. Install or update Newsmast Mastodon using its own procedure and migrations; do not assume one repository manages the other's schema.

## Patchwork Hub activation

Patchwork Hub is optional. When used for synchronized keyword-filter groups and server settings, configure its URL in the Dashboard environment and add Hub API credentials through the Dashboard API-key interface. A Dashboard can retain local configuration without Hub, but Hub-synchronized operations will not run.

## Dependency matrix

| Capability | Configuration owner | Runtime owner | Mechanism | Dashboard absent |
| --- | --- | --- | --- | --- |
| Channels, starter packs, collections | Dashboard | Newsmast Mastodon | shared database / Newsmast custom API | Gem cannot use Dashboard-managed definitions |
| Channel reblogging | Dashboard | Newsmast Mastodon | shared database / Mastodon REST API / Redis/Sidekiq | No Dashboard boost-bot configuration |
| Global and community filters | Dashboard | Newsmast Mastodon | shared database / Redis/Sidekiq | No Dashboard-managed filter configuration |
| Search, long posts, local-only availability | Dashboard | Newsmast Mastodon/Mastodon | shared database / Patchwork Hub API | Host behavior depends on its own defaults/configuration |
| Account deletion and relays | Dashboard | host/gem endpoints | Mastodon REST API / Newsmast custom API | Dashboard workflows unavailable |
| Bluesky bridge and email branding | Dashboard | Dashboard jobs and host support | external service / shared database | Feature provisioning unavailable |
| Drafts, reactions, Ghost, WordPress, CiviCRM | Newsmast Mastodon | Newsmast Mastodon | gem configuration | Not required |

## Features

- [Channels](features_channels.md)
- [Content filters](features_content_filters.md)
- [Server settings](features_server_settings.md)
- [Administration](features_administration.md)
- [Integrations](features_integrations.md)

## Technical source

Read the Dashboard repository for [architecture](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/architecture/mastodon-integration.md), [Dashboard API](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/api/dashboard-api.md), and [troubleshooting](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/troubleshooting/common-issues.md).