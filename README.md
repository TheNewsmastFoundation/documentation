# Newsmast documentation

This repository contains public operator and user documentation for Newsmast products.

## Terminology

- **Newsmast Dashboard** is the administration product. Its source repository is [newsmast-dashboard](https://github.com/TheNewsmastFoundation/newsmast-dashboard).
- **Newsmast Mastodon** is the Mastodon extension gem installed in the host Mastodon application. Its source repository is [newsmast-mastodon](https://github.com/TheNewsmastFoundation/newsmast-mastodon).
- **Patchwork Hub** is an optional external synchronization service.

## Products

- [Newsmast Dashboard](newsmast-dashboard/README.md): installation, configuration, channel administration, filtering, settings, and integrations.
- [Newsmast Mastodon](newsmast-mastodon/README.md): host extension features, APIs, and gem configuration.

The Dashboard and gem are separate applications. Feature pages identify whether a component is required, optional, or not required, and the mechanism used to cooperate.

## Policy scope

This repository provides shared, cross-product policy guidance. Each product repository may also include repository-specific `SECURITY` and `GOVERNANCE` details that apply to that codebase.

## License

This repository is published under [LICENSE.md](LICENSE.md) (Creative Commons Attribution 4.0 International, CC BY 4.0). Reuse should retain attribution to The Newsmast Foundation and link back to the repository when practical.