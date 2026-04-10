## Newsmast Mastodon Plugin Account Management Features

To configure Accounts Management settings, see [https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md#accounts-management](https://github.com/TheNewsmastFoundation/documentation/blob/main/newsmast-mastodon/configuration.md#accounts-management)

### Account Management
- **Custom Account Creation**: Enhanced account creation with community admin integration
- **Auto-Follow**: Automatically follow default accounts on signup (configurable via `AUTO_FOLLOW_ACCOUNTS` env var)
- **Server Settings**: Automatic search opt-in/opt-out and Bluesky bridge configuration for new users
- **Extended Credentials**: Account credentials API includes email in response

### Push Notifications
- **Firebase Cloud Messaging (FCM)**: Full integration for iOS and Android push notifications
- **Token Management**: Create, revoke, and manage notification tokens per device
- **Mute Control**: Per-account mute status for notifications
- **Multi-Platform Support**: Support for iOS, Android, and Huawei devices
- **Rich Notifications**: Custom notifications for follows, mentions, reblogs, favourites, polls, and quotes

### Password & Email Management
- **OTP-Based Password Reset**: Secure 4-digit OTP verification for password reset
- **Password Change**: Authenticated password change with current password verification
- **Email Change**: OTP-verified email change with session revocation
- **Custom Mailers**: Branded OTP confirmation emails

### Authentication
- **Custom OAuth Behavior**: Platform-specific authentication handling
- **Bristol Cable Integration**: External membership service authentication
- **Channel-Based Login**: Role-based login restrictions for channel platforms
- **Doorkeeper Extensions**: Password grant flow with LDAP/PAM support

### User Preferences
- **Email Notification Settings**: Toggle all email notifications on/off
- **Alt-Text Settings**: User preference for alt-text reminders on media uploads
- **Locale Management**: API endpoint for setting user language preference

### Internationalization (i18n)
- **11 Supported Languages**: English, German, Spanish, French, Italian, Japanese, Portuguese, Brazilian Portuguese, Russian, and Welsh
- **Standardized API Responses**: Consistent, translatable error and success messages
- **Locale-Aware Responses**: API responses respect user's locale preference

### Mailer Customization
- **Branded Templates**: Customizable email templates with logo and brand colors
- **Dynamic Branding**: Support for custom mail header/footer logos via `SiteUpload`
- **App Store Links**: Configurable iOS and Android app store links in emails

### Database Extensions
- Server settings management
- Notification tokens storage
- Drafted statuses support
- User alt-text preferences

## API Endpoints

### Notification Tokens
```
POST   /api/v1/notification_tokens              # Create token
POST   /api/v1/notification_tokens/revoke_token # Revoke token
POST   /api/v1/notification_tokens/update_mute  # Update mute status
GET    /api/v1/notification_tokens/get_mute_status
DELETE /api/v1/notification_tokens/reset_device_tokens/:platform_type
```

### Password Management
```
POST /api/v1/custom_passwords           # Request password reset
PUT  /api/v1/custom_passwords/:id       # Update password
GET  /api/v1/custom_passwords/request_otp
POST /api/v1/custom_passwords/verify_otp
POST /api/v1/custom_passwords/change_password
POST /api/v1/custom_passwords/change_email
```

### User Settings
```
GET  /api/v1/patchwork/email_settings
POST /api/v1/patchwork/email_settings/notification
GET  /api/v1/patchwork/alttext_settings
POST /api/v1/patchwork/alttext_settings/alttext
POST /api/v1/user_locales
```
