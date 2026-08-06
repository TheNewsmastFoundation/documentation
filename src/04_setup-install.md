# Setup: Installation Instructions

If you've read our initial setup explainer and prerequisites, great! You're now ready to install and set up Newsmast, starting with the plugin gem.

## Installing the Plugin

1. From your server's Mastodon root folder, edit the `Gemfile` and add the gem (with the matching Mastodon version pinned):

```ruby
gem "newsmast_mastodon", "X.Y.Z.N"
```

You can run `cat lib/mastodon/version.rb` to see what the major/minor/patch values are, and then choose the latest gem patch as indicated in our [[Releases]].

2. Install the gem by running:

```sh
bundle install
```

3. Next, run database migrations. This will pick up the changes provided by the gem engine automatically:

```sh
bundle exec rails db:migrate
```

4. Finally, you will need to install the code-level overrides provided by the gem. Run this command: <!-- document overrides in detail elsewhere -->

```sh
bundle exec rails newsmast_mastodon:install
```

and then rebuild frontend assets:

```sh
yarn build:development  # or yarn build:production
```

Now restart the Mastodon instance (both the web server and the Sidekiq background service), and verify that it boots successfully. If there's any detected mismatch between the Mastodon version and the gem version match, you'll see an error logged to the console. <!-- Does it outright crash or is it just a warning? -->

As an additional step, have a look at the [[Customizing]] section to see what environment variables you can set to modify the behavior of the plugin or add integrations with other services.

<!-- from temp docs: "Commit the copied host-app files as part of your Mastodon instance changes." Hmm, we probably need a better strategy here? Maybe create a separate branch first? -->

If you're interested in setting up the administrative dashboard as well, keep reading for installation instructions.

## Installing the Dashboard (Optional)

To begin with, make sure you have the necessary access credentials and network information for the Mastodon instance's:

* REST API
* PostgreSQL database
* Redis

It's up to you if you want to run the dashboard on the same server as the Mastodon instance or a different server. In either case, you'll need to connect the dashboard to those three services.

Now, decide if you'd prefer to install the dashboard via a Docker container, or manually. We provide instructions for either approach.

### Docker Installation

1. Clone the repo and copy the `.env.sample` file to `.env`, then add in the various access credentials.

```sh
git clone https://github.com/TheNewsmastFoundation/newsmast-dashboard.git
cd newsmast-dashboard
cp .env.sample .env
chmod 600 .env
$EDITOR .env
```

<!-- The stuff in the temp docs about "Set EXTERNAL_PORT to the host port to publish; the container listens on port 3001." is confusing to me. Maybe we don't need to mention it? --> 

By default, Docker Compose will create and utilize the container network named `mastodon_internal_network`. You can edit `docker-compose.yml` file if necessary to change the network for the `app` service.

> [!IMPORTANT]
> Do not commit `.env` or use any of the placeholder secrets.

2. Pull and boot the Docker image.

```sh
docker compose pull
docker compose up -d
docker compose ps
docker compose logs app
```

Once you've verified the application has booted successfully, you can run the database migrations and seeds for initial application data.

```sh
docker compose exec app bundle exec rails db:migrate
docker compose exec app bundle exec rails db:seed
```

3. Log into the dashboard with your admin credentials (as specified in `.env`).

...

<!-- What is the public address? https://localhost:3001 ? -->

### Manual Installation

1. Clone the repo and copy the `.env.sample` file to `.env`, then add in the various access credentials.

```sh
git clone https://github.com/TheNewsmastFoundation/newsmast-dashboard.git
cp .env.sample .env
$EDITOR .env
```

2. Install dependencies, setup database <!-- what about frontend assets? -->, and boot the Rails application server.

```sh
bin/setup
bundle exec rails server
```

3. Log into the dashboard with your admin credentials (as specified in `.env`).


## Further Setup

<!-- Further setup notes like setting up a reverse proxy, file permissions, etc. -->

If you need to upgrade in the future, [[read the guide here]].
