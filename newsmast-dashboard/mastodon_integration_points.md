# Integration Points with Mastodon

Mastodon does not offer an "official" API for plugins or extensions to the core software. Thus we have added this outline of the ways the Newsmast plugin gem, dashboard, and apps integrate with and extend Mastodon.

As much as possible, we have avoided patching any of Mastodon's code directly at the source file level. Newsmast is not a "fork" of Mastodon. However, we do patch in real-time (aka monkeypatch) several Mastodon subsystems, and in vary rare cases where monkeypatching is not possible, we modify certain files in the Mastodon repo on disk  (documented below). We also access the Mastodon database directly from within Newsmast, both updating the DB schema or adding new tables to support Newsmast features.

## Database Integrations

New tables / updated tables / views/queries / etc.

## Monkeypatches

Controllers / models / views/emails / etc.

## Source File Changes

### Chewy

...
