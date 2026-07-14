# Newsmast Mastodon Documentation
This documentation covers installation, updating, and feature documentation for the [newsmast-mastodon ruby gem](https://github.com/TheNewsmastFoundation/newsmast-mastodon).

The gem is a Rails engine that mounts inside a host Mastodon server to add content filters, post management, account management, custom feeds, content channels, and integrations with the Newsmast mobile apps and the [Newsmast Dashboard](https://github.com/TheNewsmastFoundation/newsmast-dashboard).

## Versioning

The gem uses compatibility-first versioning: `X.Y.Z.N`.

- `X.Y.Z` tracks the target Mastodon version.
- `N` is the gem patch level for that exact Mastodon line.

Examples:

- `4.5.11.0` is the first gem release for Mastodon `4.5.11`.
- `4.5.11.1` is a gem-only patch release, still for Mastodon `4.5.11`.
- `4.5.12.0` starts support for Mastodon `4.5.12`.

Always install a gem version whose `X.Y.Z` matches your Mastodon server version.

## Installation

### Prerequisites

- A running Mastodon server whose version matches the gem version you intend to install (e.g. `newsmast_mastodon 4.5.11.x` requires Mastodon `4.5.11`).
- Ruby `>= 3.2.0, < 3.5.0` (the gem is tested against Ruby 3.2, 3.3, and 3.4).
- Access to the Mastodon server's `Gemfile` and the ability to run migrations and restart services.

### Installing into your Mastodon server

1. Add the gem to your Mastodon server's `Gemfile`, pinning the exact version that matches your Mastodon version:

   ```ruby
   gem "newsmast_mastodon", "X.Y.Z.N"
   ```

2. Install the gem:

   ```bash
   bundle install
   ```

3. Run database migrations. The engine automatically appends its migrations to the host application, so a standard migrate picks them up:

   ```bash
   bundle exec rails db:migrate
   ```

4. Configure the plugin using environment variables. See [configuration.md](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md).

5. Restart your Mastodon web and Sidekiq services so the engine, routes, and background workers are loaded.

The engine mounts its routes at the server root (they are not namespaced under a sub-path) and verifies at boot that the host Mastodon version matches the gem's declared requirement. A mismatch produces a warning in development and test, and aborts boot in production.

## Updating

1. Choose a gem version whose `X.Y.Z` matches your target Mastodon version (see [Versioning](#versioning)).
2. Update the pin in your Mastodon server's `Gemfile`:

   ```ruby
   gem "newsmast_mastodon", "X.Y.Z.N"
   ```

3. Reinstall and migrate:

   ```bash
   bundle install
   bundle exec rails db:migrate
   ```

4. Review [configuration.md](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md) for any new environment variables introduced by the update.
5. Restart your Mastodon web and Sidekiq services.

When upgrading Mastodon itself, upgrade Mastodon and the gem together so their `X.Y.Z` versions stay aligned.

## Newsmast Dashboard dependencies

Many features in the gem work without the Newsmast Dashboard. Some features, however, consume records or server settings managed by the [Newsmast Dashboard](https://github.com/TheNewsmastFoundation/newsmast-dashboard).

| Feature area | Dashboard dependency | Configuration owner | Runtime owner | Mechanism and absence behavior |
|--------------|----------------------|---------------------|---------------|-------------------------------|
| [Content filters](features_content_filters.md) and community automation | Required | Dashboard | Gem | Shared database and Redis/Sidekiq. Dashboard manages filter/channel data; gem applies supported rules. Without Dashboard-managed records, this configuration is absent. |
| [Channel-backed custom feeds and starter packs](features_custom_feeds.md) | Required | Dashboard | Gem | Shared database and Newsmast custom API. The gem cannot expose Dashboard-managed definitions if they are absent. |
| [Server-level account and post settings](features_posts.md) | Required for Dashboard-managed settings | Dashboard | Gem/host Mastodon | Shared database and Patchwork Hub API. The host uses its own available defaults when Dashboard data is absent. |
| Account deletion and relay custom APIs | Optional | Dashboard | Gem/host Mastodon | Mastodon REST API and Newsmast custom API. Dashboard workflows are unavailable when it is absent. |
| Bluesky bridge and email branding | Required for Dashboard-managed provisioning | Dashboard | Gem/host/external service | Shared database and external service. The gem's unrelated features continue without it. |
| Account APIs, drafts, reactions, and notifications | Not required | Gem/host Mastodon | Gem/host Mastodon | Gem configuration and host APIs. |
| Ghost, WordPress, Firebase, CiviCRM, ALT text, and relay timeline integrations | Not required | Gem/external service | Gem/external service | Gem configuration and external service. |

Dependency notes in each feature page identify which parts require dashboard-managed data or configuration. Code identifiers containing `Patchwork`, including API paths and model names, retain their implementation names.

For Dashboard operator workflows, see [Newsmast Dashboard](../newsmast-dashboard/README.md) and its [technical architecture reference](../newsmast-dashboard/mastodon_integration_points.md).

## Features / Configuration
 - [Accounts](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_accounts.md)
 - [Content Filters](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_content_filters.md)
 - [Custom Feeds](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_custom_feeds.md)
 - [Posts](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_posts.md)
 - [Integrations](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/features_integrations.md)

Environment Variables: [configuration.md](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md)

## Development

Contributor and maintainer material (development setup, testing, CI, upgrade runbooks, and the override-drift system) lives in the [newsmast-mastodon gem repository](https://github.com/TheNewsmastFoundation/newsmast-mastodon) under its `docs/` folder.
