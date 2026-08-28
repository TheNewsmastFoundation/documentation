# Setup: What You Need to Know

## Plugin Prerequisites and Compatibility

First, ensure you've set up a Mastodon server which has been recently updated to a supported version. The [`newsmast_mastodon`](https://github.com/TheNewsmastFoundation/newsmast-mastodon) gem tracks Mastodon versions using an `X.Y.Z.N` scheme (major/minor/patch will match Mastodon releases, plus an additional gem-specific patch version). <!-- More release process & versioning details to be linked to from here. -->

Secondly, ensure you're running a supported version of Ruby. Our testing matrix covers v3.2 through v3.4.

The installation process will modify the Mastodon database, so you should make sure you have working backup in place in case you run into any issues and that (if necessary) you've notified users of temporary downtime.

After adding the plugin, you may need to configure a few environment variables. These are documented in the [[Customizing]] section.

## Dashboard Prerequisites

Alongside a Mastodon server which has been extended with the `newsmast_mastodon` plugin gem, you can set up the standalone Rails-based [`newsmast-dashboard`](https://github.com/TheNewsmastFoundation/newsmast-dashboard) application. It will connect to the Mastodon server via the REST API & PostgreSQL database access, along with using Redis.

You can install & deploy the Newsmast Dashboard directly from source or using Docker. You may want to choose the source route if you're experienced with managing Rails applications and related dependencies directly. Otherwise, you can go the Docker route.

You will need to know how to set up your web server (Caddy, nginx, Apache, etc.) in order to expose the application via a reverse proxy and domain you're able to access from a browser.

<!-- Q: Does the dashboard need to be "public"? Or can it live behind a private network / VPN / whatever? -->

## Third-Party Integrations

Other than required integrations such as email sending, these integrations help support various features you may want to enable for your community.

* [Firebase FCM](https://firebase.google.com/docs/cloud-messaging/) - Used for push notifications in mobile apps.
* [CiviCRM](https://civicrm.org/) - You can restrict user access to verified members of a CiviCRM instance.
* [Ghost](https://ghost.org/) - You can notify subscribers when a newsletter or post is published.
* [WordPress](https://wordpress.org/) - You can notify subscribers when a post is published.
* [FediBuzz](https://relay.fedi.buzz/) - Pull additional Fediverse content in fill the Federated Timeline of your server.
* [AltText.ai ](https://alttext.ai/) - Used for automatic generation of alt text for images.
* [Bridgy Fed](https://fed.brid.gy/) & [Route53](https://aws.amazon.com/route53/) - You can use your own domain name for bridged accounts to Bluesky and the ATmosphere.

More information is available shortly on how to enable and customize these integrations via environment variables as part of the setup process.

> [!NOTE]
> You may occasionally come across mentions of the "Patchwork Dashboard" or `patchwork_dashboard` — these refer to a previous (legacy) implementation.
