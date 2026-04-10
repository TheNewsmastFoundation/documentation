# Newsmast Dashboard Documentation
This documentation covers installation, updating, and feature documentation for the [newsmast-dashboard](https://github.com/TheNewsmastFoundation/newsmast-dashboard)

## Installation

### Prerequisites
 - A running Mastodon service with matching version (e.g. newsmast-dashboard-4.5.2 requires Mastodon 4.5.x)
 - [newsmast-mastodon](https://github.com/TheNewsmastFoundation/newsmast-mastodon) with matching version installed on your Mastodon instance (e.g. mastodon-4.5.8 requires newsmast-mastodon-4.5.x)
 - Ruby (check version here)

### Installing from source

1. Download newsmast-dashboard repository: LINK_TO_RELEASES
2. Create .env file by copying the .env.sample file: ```cp .env.sample .env```
3. Read the comments in the ENV file thoroughly and configure the environment accordingly. (See [configuration](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md))
4. Install the gems: ```bundle install```
5. Run database migrations: ```bundle exec rails db:migrate```
6. Import required data and create a master admin account: ```bundle exec rails db:seed```
7. Start your server(change the port number according to your need): ```bundle exec rails s -p 3002```

### Installing with Docker
Before starting, ensure you have Docker Engine (version 20.10+ recommended) and Docker Compose (version 2.0+ recommended) installed.

1. Verify Docker installation:
   ```
   docker --version
   docker compose version
   ```

2. Clone the repository
   ```
   git clone https://github.com/patchwork-hub/patchwork_dashboard.git
   cd patchwork_dashboard
   ```

3. Configure environment
Create .env file by copying the .env.sample file: ```cp .env.sample .env```
Read the comments in the ENV file thoroughly and configure the environment accordingly. (See [configuration](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md))

4. Start the application

   4.1 Pull and Start Services:
      ```
      # Pull the latest image
      docker compose pull

      # Start the services in detached mode
      docker compose up -d --build
      ```
   4.2 Verify Container Status:
      ```
      # Check if container is running
      docker compose ps

      # Check container logs
      docker compose logs -f dashboard
      ```

6. Initialise the database
   ```
   # Run migrations
   docker compose exec dashboard bundle exec rails db:migrate

   # Seed the database (creates initial data and master admin)
   docker compose exec dashboard bundle exec rails db:seed
   ```

### Access the Dashboard
Go to: http://your-server-ip:3001 (or your configured domain). You should see the Newsmast Dashboard login page. Login with the primary admin credentials you created.

### Activate the Dashboard: Add an API key by following below steps:
1. Generate an API key: Go to Patchwork Hub, register a new account and verify it. Once you have verified it, generate an API key on the landing page of the Patchwork Hub.
2. Add the generated API key in your Newsmast Dashboard: Login to your Newsmast Dashboard with the primary admin account. On the left-side menu, click the "API key". In the API key page, add the Key and Secret values generated from the Patchwork Hub.

## Updating

## Features / Configuration
See
