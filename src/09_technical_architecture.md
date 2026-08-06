# Details on Technical Architecture

## Integration Points with Mastodon

Mastodon does not offer an "official" API for plugins or extensions to the core software. Thus we have added this outline of the ways the Newsmast plugin gem & dashboard integrate with and extend Mastodon.

> [!NOTE]
> Not all Newsmast installations require the dashboard to be set up, but they all use the plugin in order to power certain features of the apps.

As much as possible, we have avoided patching any of Mastodon's code directly at the source file level. Newsmast is not a "fork" of Mastodon. However, we do patch in real-time (aka monkeypatch) several Mastodon subsystems, and in vary rare cases where monkeypatching is not possible, we modify certain files in the Mastodon repo on disk  (documented below). We also access the Mastodon database directly from within Newsmast, both updating the DB schema or adding new tables to support Newsmast features, and there are some calls to the Mastodon REST API via an application token.

<!-- 
It looks like the `db/schema.rb` file is the combined Patchwork tables and typical Mastodon tables. I'm wondering what the process is for managing that in terms of updates…I'm guessing this is the "system of record" schema file rather than the one in the Mastodon repo install?
-->

### New Database Tables

...
<!-- to fill in -->

### Updated Tables (Existing Mastodon)

...
<!-- to fill in -->

### Other Database Enhancements

Views? Queries?
<!-- to fill in -->

### Monkeypatches

Controllers / models / views/emails / etc.
<!-- to fill in -->

### Source File Changes

#### Chewy

...
<!-- to fill in -->

### REST API Access

...
<!-- to fill in -->
