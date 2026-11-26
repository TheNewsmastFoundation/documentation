# Accounts

Endpoints live under `/api/v1`. Unless noted, they need an OAuth token with `read write` scopes and a signed-in user.

## Sign-up

`POST /api/v1/accounts` is extended so that:

- the `reason` defaults to `Signing up via <LOCAL_DOMAIN> App` when empty;
- a 4-digit OTP is generated and emailed to the new user right after creation;
- sign-up is rejected unless the email domain is listed in `ALLOWED_SIGNUP_EMAIL_DOMAIN` (comma-separated; all domains are allowed when unset).

After a user is approved (`prepare_new_user!`):

1. **Auto-follow:** accounts are followed from the Dashboard auto-follow list for this instance if one exists (an enabled list wins; a disabled list turns auto-follow off). Otherwise the env fallback applies when `AUTO_FOLLOW_ENABLED=true`, using `AUTO_FOLLOW_ACCOUNTS`.
2. A welcome email is queued after one hour, unless `WELCOME_EMAIL_DISABLED=true`.
3. If `DEFAULT_EMAIL_NOTIFICATIONS_ENABLED` is set, all `notification_emails.*` settings start as `true` or `false` accordingly.
4. If the Dashboard setting `Automatic Search Opt-out` is on, the account is created non-discoverable and non-indexable.

`PATCH /api/v1/accounts/update_credentials` also redistributes the profile update to followers.

## Password and email

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/custom_passwords` | Start a password reset for an email: stores a reset token and OTP, emails the OTP. |
| GET | `/custom_passwords/request_otp` | Send a fresh OTP. |
| POST | `/custom_passwords/verify_otp` | Verify the OTP (also confirms the user, or completes an email change) and return an access token. |
| PATCH/PUT | `/custom_passwords/:id` | Set a new password with `password` and `password_confirmation`, after the OTP is verified. |
| POST | `/custom_passwords/change_password` | Authenticated change; needs `current_password`. |
| POST | `/custom_passwords/change_email` | Authenticated email change; confirmed via OTP. |

The first four endpoints do not require authentication.

## Notification tokens

Device tokens for Firebase push (`FIREBASE_PROJECT_ID`, `FIREBASE_KEY_FILE_NAME`).

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/notification_tokens` | Register `notification_token` and `platform_type`. |
| POST | `/notification_tokens/revoke_token` | Remove one token. |
| POST | `/notification_tokens/update_mute` | Set `mute` on all of the user's tokens. |
| GET | `/notification_tokens/get_mute_status` | Read the mute flag. |
| DELETE | `/notification_tokens/reset_device_tokens/:platform_type` | Remove all tokens for a platform. |

## Cross-instance push

`POST /api/v1/cross_instance_push` accepts push requests from a trusted partner instance. Requests must carry an `X-Signature` header of the form `t=<unix time>, sha256=<hmac>`, signed with `CROSS_INSTANCE_PUSH_SECRET`; timestamps older than 300 seconds are rejected. Body: `username`, `title` (1–255 chars), `body` (1–1000 chars), optional `data` (up to 10 keys, values up to 500 chars). Valid requests return `202` and are delivered by a Sidekiq worker. Outbound sending is on only when both `CROSS_INSTANCE_PUSH_TARGET_URL` and the secret are set.

## Settings

| Method | Path | Purpose |
| --- | --- | --- |
| POST | `/user_locales` | Save the user's locale (`lang`); `400` if unavailable. |
| GET / POST | `/patchwork/email_settings`, `/patchwork/email_settings/notification` | Read or toggle all email notifications at once (`allowed`). |
| GET / POST | `/patchwork/alttext_settings`, `/patchwork/alttext_settings/alttext` | Read or set automatic alt text (`enabled`). |
| GET | `/patchwork/conversations/check_conversation` | Latest conversation with `target_account_id`. |
| POST | `/patchwork/conversations/read_all` | Mark all conversations read. |

## Account deletion

- `POST /delete_account` with `password`: verifies the password, suspends the account and queues deletion (the username is reserved).
- `DELETE /patchwork/account_deletion/:id`: deletes an account immediately without reserving email or username.

## Deep links

`/.well-known/apple-app-site-association` and `/.well-known/assetlinks.json` are served from the deep-link variables listed in [Configuration](configuration.md).
