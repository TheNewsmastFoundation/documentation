# Newsmast Dashboard Documentation
This documentation covers installation, updating, and feature documentation for the [newsmast-dashboard](https://github.com/TheNewsmastFoundation/newsmast-dashboard)

## Installation

### Prerequisites
 - A running Mastodon service with matching version (e.g. newsmast-dashboard-4.5.2 requires Mastodon 4.5.x)
 - The [newsmast-mastodon](https://github.com/TheNewsmastFoundation/newsmast-mastodon) plugin with matching version installed on your Mastodon instance (e.g. mastodon-4.5.8 requires newsmast-mastodon-4.5.x)
 - Ruby (check `.ruby-version` for required version)
 - PostgreSQL
 - Redis
 - ImageMagick

### Installing from source

1. Download newsmast-dashboard repository: LINK_TO_RELEASES
2. Create .env file by copying the .env.sample file: ```cp .env.sample .env```
3. Read the comments in the ENV file thoroughly and configure the environment accordingly. (See [configuration](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md))
4. Install the gems: ```bundle install``` 
5. Run database migrations: ```bundle exec rails db:migrate```
6. Import required data and create a master admin account: ```bundle exec rails db:seed```
7. Start your server(change the port number according to your need): ```bundle exec rails s -p 3002```

### Installing with Docker
See [docker_install.md](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-dashboard/docker_install.md)

### Access the Dashboard
Go to: http://your-server-ip:3001 (or your configured domain). You should see the Newsmast Dashboard login page. Login with the primary admin credentials you created.

### Activate the Dashboard
1. Generate an API key: Go to Patchwork Hub, register a new account and verify it. Once you have verified it, generate an API key on the landing page of the Patchwork Hub.
2. Add the generated API key in your Newsmast Dashboard: Login to your Newsmast Dashboard with the primary admin account. On the left-side menu, click the "API key". In the API key page, add the Key and Secret values generated from the Patchwork Hub.

## Updating

## Features / Configuration
See [configuration](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md)

## Development

The application is built with the following technologies:

- Ruby on Rails 7.1
- Puma server
- Sidekiq (background jobs)
- Spockets & Import Maps (frontend)
  - Bootstrap 4
  - jQuery & Sass
  - Turbo & Stimulus
  - jspm.io (third-party frontend assets CDN)
- kt-paperclip (file attachments)
  - _maintained fork of the original paperclip gem_

In addition, the following service integrations are required:

- S3-compatible object storage for file storage (e.g., AWS S3, DigitalOcean Spaces)

### Code Quality Tools

The project includes several development tools:

- **Bullet**: N+1 query detection
- **Rack Mini Profiler**: Request profiling
- **RuboCop**: Ruby style guide enforcement
- **AnnotateRB**: Schema annotation for models
