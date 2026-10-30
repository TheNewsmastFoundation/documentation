# Newsmast Dashboard Docker installation

Install Docker Engine/Compose, prepare a running Mastodon deployment with reachable PostgreSQL and Redis, and create the required external Docker network before deployment. Copy the Dashboard sample environment file to `.env`, provide real secrets, and protect that file with restrictive permissions.

Follow the canonical [Newsmast Dashboard Docker procedure](https://github.com/TheNewsmastFoundation/newsmast-dashboard/blob/main/docs/configuration/docker-installation.md) for exact commands, service names, health checks, migrations, logs, backups, and updates.

The dashboard container listens on port `3001`; `EXTERNAL_PORT` only controls which host port is published by Compose.

After startup, confirm the container health, sign in as the configured master administrator, and test the required Mastodon connection. The canonical troubleshooting guide covers connection, worker, filter, and external-integration failures.