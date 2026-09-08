# Upgrading & Maintenance

## Plugin Gem

When you upgrade your Mastodon instance, you'll also need to ensure you've selected a matching version of the gem. Update the pinned version in the `Gemfile`:

```sh
gem "newsmast_mastodon", "X.Y.Z.N"
```

(See [[VERSIONS]] for the latest gem release matching the Mastodon version.)

Then install the update and any new database migrations:

```sh
bundle install
bundle exec rails db:migrate
```

Reinstall Chewy indexes and frontend override files and rebuild assets (overrides may change between versions):

```sh
bundle exec rails newsmast_mastodon:install
yarn build:production
```

Review the [[Customizing Newsmast]] documentation to ensure you still have environment variables set as needed.

Then restart your Mastodon web and Sidekiq services.

## Admin Dashboard

...

<!-- TODO: this needs to be filled in -->

<!-- TODO: Any maintenance tasks required? Keeping things up-to-date and running smoothly… -->