# Getting the Lay of the Land

If you administrate one or more Mastodon instances at the _host_ level (meaning you have direct command line access to the installation of Mastodon and it's not controlled by a managed hosting provider), you can set up Newsmast.

Continuing reading to learn about the features Newsmast brings to Mastodon & the broader Fediverse ecosystem and an overview of what you need to know to install Newsmast successfully. Additional low-level configuration and API details are provided for when you need to go deeper.

## Available Features

When you set up the `newsmast_mastodon` Ruby gem plugin by itself (aka without the admin dashboard), you get:

* Basic Accounts Management: … <!-- to fill in -->
* Enhancements to Posting: … <!-- to fill in -->
* Integrations with other services (some): … <!-- to fill in -->

Additionally, with the `newsmast-dashboard` application installed, you get:

* Advanced Accounts Management: … <!-- to fill in -->
* Channels & Custom Feeds: … <!-- to fill in -->
* Content Filters: … <!-- to fill in -->
* Administration: … <!-- to fill in -->
* Additional integrations with other services: … <!-- to fill in -->

There are also some setting synchronization features available when you activate Patchwork Hub for the dashboard. … <!-- to fill in -->

## How the Plugin Works

The `newsmast_mastodon` Ruby gem behaves as a plugin of sorts, mounted as an engine within the Rails-based Mastodon application. Since Mastodon doesn't have an official plugin API, the gem modifies Mastodon at the software level through a combination of new code paths, monkeypatches, and in rare cases, altering Mastodon's source files. We try to minimize the more drastic changes, and this documentation includes descriptions of many of these modifications.

## How the Dashboard Application Works

The `newsmast-dashboard` codebase is a standalone Ruby on Rails application for administrators, running independently of its connected Mastodon instance. It does access the instance database, however, and stores additional content there as well as communicates with the instance through Mastodon's API (which has been extended by `newsmast_mastodon`).
