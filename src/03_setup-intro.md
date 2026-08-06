# Setup: What You Need to Know

## Plugin Prerequisites and Compatibility

First, ensure you've set up a Mastodon server which has been recently updated to a supported version. The `newsmast_mastodon` gem tracks Mastodon versions using an `X.Y.Z.N` scheme (major/minor/patch will match Mastodon releases, plus an additional gem-specific patch version). <!-- More release process & versioning details linked from here. -->

Secondly, ensure you're running a supported version of Ruby. Our testing matrix covers v3.2 through v3.4.

The installation process will modify the Mastodon database, so you should make sure you have working backup in place in case you run into any issues and that (if necessary) you've notified users of temporary downtime.

After adding the plugin, you may need to configure a few environment variables. These are documented in the [[Customizing]] section.

## Dashboard Prerequisites

Alongside a Mastodon server which has been extended with the `newsmast_mastodon` plugin gem, you can set up the standalone Rails-based `newsmast-dashboard` application. It will connect to the Mastodon server via the REST API & PostgreSQL database access, along with using Redis.

You can install & deploy the Newsmast Dashboard directly from source or using Docker. You may want to choose the source route if you're experienced with managing Rails applications and related dependencies directly. Otherwise, you can go the Docker route.

You will need to know how to set up your web server (Caddy, nginx, Apache, etc.) in order to expose the application via a reverse proxy and domain you're able to access from a browser.

<!-- So, does the dashboard need to be "public"? Or can it live behind a private network / VPN / whatever? -->

<!-- What do we need ot say about Patchwork Hub sync? -->

## Third-Party Integrations

...
<!-- to fill in -->

> [!NOTE]
> You may occasionally come across mentions of the "Patchwork Dashboard" or `patchwork_dashboard` — these refer to previous (legacy) implementation & deployment identifiers only.
