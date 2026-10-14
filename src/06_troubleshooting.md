# When Things Go Wrong

There are a number of categories of issues you may run into with setting up the plugin gem or the admin dashboard. Let's step through these and explore what you can do to track down the relevant conundrums:

## Plugin Gem Setup Fails

If you're running into any difficulties installing the plugin gem, double-check that you've met the [[version prerequisites]]. There could be a mismatch with the Ruby version being run and what we currently support (run `ruby -v` to verify). Also ensure you are running the correct gem version with compatibility for the Mastodon version.

If you need to upgrade to newer versions of some part of your tech stack, we recommend upgrading to the nearest higher version to minimize possible disruptions. If that goes well, you can decide to move forward a version once more (and so on) until you've reached your desired target.

## Mastodon Instance No Longer Boots

First, try to determine where the problem lies. Does it seem like the crash logs indicate a problem within the Mastodon codebase, or in the gem codebase? You could see if commenting out the entry in `Gemfile`, running `bundle install`, and booting Mastodon gets it working again as a baseline assumption. Or maybe something else is going on with regard to your server environment.

It's possible you may have missed setting up certain environment variables required for your setup, or perhaps there's a ENV var that got set incorrectly. Take a look through [[Customizing]] and make sure you've entered in everything you need correctly.

## Mastodon Instance Randomly Causes Runtime Errors

If you are noticing lots of errors behind the scenes in logs, or are noticing literal crash screens at times while using the Mastodon instance, there are a couple of things you could try:

* Upgrading the Mastodon instance & the plugin gem to a newer version (a bug may have been fixed).
* Like with boot issues, there could be an issue related to the configuration of ENV vars.

## Dashboard Setup Fails

The admin dashboard requires connecting to the same PostgreSQL as the Mastodon instance. Make sure you've set up the connection to mirror how Mastodon connects to the database. You can do the same for the Redis connection, though it's not mandatory to use the same Redis service.

You can test the database connection by running:

```sh
bundle exec rails runner "puts ActiveRecord::Base.connection.execute('SELECT 1').first"
```

or for Docker installations:

```sh
docker compose exec app bundle exec rails runner "puts ActiveRecord::Base.connection.execute('SELECT 1').first"
```

And just as with the plugin gem, it's possible you may have missed fully configuring the necessary environment variables.

Start by confirming the `MASTODON_INSTANCE_URL` points to your Mastodon install, and verify application token/client credentials created in the Mastodon instance were created with the required scopes and are set in your environment. Also verify your S3-compatible storage endpoint/bucket/region credentials.

## Dashboard Causes Runtime Errors

If you are noticing any instability when running the admin dashboard, you may want to check the health of your Mastodon instance, the shared PostgreSQL database, and Sidekiq queues—all of which will have an effect on the functioning of the dashboard.

For Docker-based installations, you can run `docker compose ps` and `docker compose logs app` for more insight in how the app is running.

Also bear in mind there are a lot of moving parts when it comes to bridged Bluesky accounts. You'll want to double-check how you've set up `USE_LOCAL_DOMAIN` along with related DNS propagation (if set to `true`) before retrying bridge provisioning.

----

If you are still running into issues with installing or operating the plugin gem or dashboard, learn how to find answers via our [[Support]] page.
