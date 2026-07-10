# Newsmast Mastodon Plugin Posts Features

> **Newsmast Dashboard integration:** The dashboard manages server-level settings such as character limits and local-only post availability, as well as community channel and boost-bot configuration. Drafts, scheduled and quote posts, reactions, link previews, and notification enhancements are provided by the gem or Mastodon without requiring the dashboard.

## Post Management
- **Custom Character Limits**: Configure custom character limits per instance through server settings (default: 500 characters)
- **Draft Status Management**: Create, update, publish, and delete draft posts with full API support
- **Scheduled Posts**: Extended scheduled status management with custom parameters
- **Quote Posts**: Support for quoting other posts with visibility inheritance
- **Reply Threading**: Enhanced reply management with thread validation

### Media & Content Enhancement
- **Automatic ALT Text Generation**: AI-powered automatic ALT text generation for images using external API integration
- **Link Preview Generation**: Automatic link thumbnail generation with customizable metadata extraction
- **Media Attachment Management**: Support for multiple image formats (JPEG, PNG, GIF, WebP, BMP) with validation
- **Draft Media Association**: Media attachments can be associated with draft statuses

### Notification Enhancements
- **Direct Mention Filtering**: Filter notifications to show only direct mentions
- **Private Mention Exclusion**: Option to exclude private/direct mentions from notification lists
- **Grouped Notifications**: Enhanced notification grouping with custom type support
- **Extended Notification API**: V1 and V2 API enhancements for better filtering

### Automation & Integration
- **Post Boosting**: Automatic post boosting to external instances with worker support
- **Custom Boost Bots**: Add or remove statuses to/from per-account custom boost bot instances
- **Relay Management**: Create and delete relay connections for federated content
- **Custom Timeline Filtering**: Extended account status filtering with multiple exclusion options
- **Boost Channel Management**: Special handling for boost bot accounts configured for Newsmast Dashboard communities

### Engagement
- **Custom Status Reactions**: Emoji reactions on statuses, stored per account with add/update and remove support
- **Local-Only Posts**: Per-account setting controlling whether posts are kept local to the instance; server-level availability is managed in the Newsmast Dashboard

### Server Configuration
- **Flexible Server Settings**: Hierarchical server settings managed in the Newsmast Dashboard and consumed by the gem
- **Environment-Based Toggles**: Feature flags for ALT text generation, post boosting, and user toggles
- **Instance Serialization**: Extended instance metadata with custom configuration exposure

## API Endpoints

### Draft Management
```
POST   /api/v1/drafted_statuses           # Create a new draft
GET    /api/v1/drafted_statuses           # List all drafts (grouped by date)
GET    /api/v1/drafted_statuses/:id       # Show a specific draft
PUT    /api/v1/drafted_statuses/:id       # Update a draft
DELETE /api/v1/drafted_statuses/:id       # Delete a draft
POST   /api/v1/drafted_statuses/:id/publish # Publish a draft as a status
```

### Utilities
```
GET    /api/v1/utilities/link_preview     # Generate link preview for a URL
```

### Status Reactions
```
PUT    /api/v1/patchwork/statuses/:status_id/reactions/:id  # Add or update a reaction on a status
DELETE /api/v1/patchwork/statuses/:status_id/reactions/:id  # Remove a reaction from a status
```

`:id` is the reaction identifier (for example, the emoji shortcode or name being applied).

### Custom Boost Bots
```
POST   /api/v1/custom_statuses/add_custom_boost_bot_status     # Add a status to a custom boost bot
POST   /api/v1/custom_statuses/remove_custom_boost_bot_status  # Remove a status from a custom boost bot
```

Custom boost bots are configured with `{USERNAME}_INSTANCE_URL`, `{USERNAME}_CLIENT_ID`, and `{USERNAME}_CLIENT_SECRET` environment variables (replace `{USERNAME}` with the bot username in uppercase). See the gem's [environment variables reference](https://github.com/TheNewsmastFoundation/newsmast-mastodon/blob/main/docs/configuration/environment-variables.md#custom-boost-bot).

### Local-Only Posts
```
GET    /api/v1/local_only_posts/getLocalOnlySetting  # Get the account's local-only post setting
```

### Relay Management
```
POST   /api/v1/patchwork/relays           # Create a new relay connection
DELETE /api/v1/patchwork/relays/:id       # Remove a relay connection
```
