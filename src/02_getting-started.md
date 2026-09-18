# Getting the Lay of the Land

If you administrate one or more Mastodon instances at the _host_ level (meaning you have direct command line access to the installation of Mastodon and it's not controlled by a managed hosting provider), you can set up Newsmast.

Continuing reading for an overview of what you need to know to install Newsmast successfully. Additional low-level configuration and API details are provided for when you need to go deeper.

## How the Plugin Works

The `newsmast_mastodon` Ruby gem behaves as a plugin of sorts, mounted as an engine within the Rails-based Mastodon application.

Since Mastodon doesn't have an official plugin API, the gem modifies Mastodon at the software level through a combination of new code paths, monkeypatches, and in rare cases, altering Mastodon's source files. We try to minimize the more drastic changes, and this documentation includes descriptions of many of these modifications.

## How the Dashboard Application Works

The `newsmast-dashboard` codebase is a standalone Ruby on Rails application for administrators, running independently of its connected Mastodon instance. It does access the instance database, however, and stores additional content there as well as communicates with the instance through Mastodon's API (which has been extended by `newsmast_mastodon`).

There are also some setting synchronization features available when you activate Patchwork Hub for the dashboard, as well as pulling in content moderation filters.

<!-- Q: do we have a link anywhere to what the Patchwork Hub is and how that works? -->
