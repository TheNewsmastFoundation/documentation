# Newsmast Mastodon Plugin Posts Features
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
- **Relay Management**: Create and delete relay connections for federated content
- **Custom Timeline Filtering**: Extended account status filtering with multiple exclusion options
- **Boost Channel Management**: Special handling for boost bot accounts

### Server Configuration
- **Flexible Server Settings**: Hierarchical server settings with parent-child relationships
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

### Relay Management
```
POST   /api/v1/patchwork/relays           # Create a new relay connection
DELETE /api/v1/patchwork/relays/:id       # Remove a relay connection
