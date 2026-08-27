# Documentation "Website"

> [!IMPORTANT]
> While still in draft, additional working commentary is embedded in HTML comments. (Look at the Markdown files directly in [Code View](01_index.md?plain=1).)

<!-- The Markdown files in this folder are intended to be structured closer to their final destination within an official docs website. -->

<!-- NOTE: everything in src/ is intended (eventually) to supersede `newsmast-dashboard` & `newsmast-mastodon` folders in this repo. -->


The [Newsmast Foundation](https://newsmastfoundation.org) helps mission-driven organisations move their communities to a custom, directly-managed platform. We bring people together in safe, healthy, independent spaces with our flexible, user-friendly customised apps.


At the core of our platform is a Mastodon-based installation with custom extensions to support a set of tentpole features and additional functionality. This is accomplished through **(a)** a plugin which runs within the Mastodon host, and **(b)** an optional admin dashboard application. Both of these aspects support our mobile app delivery. 


## Features Enabled by the Plugin

### Basic Accounts Management

Through connection to client membership databases, our apps can cross-check new signups against membership status ensuring that only community members can access the community space.

### Enhancements to Posting

We’ve worked hard to remove some of the pain-points that trouble new Mastodon users. Namely, direct messages and replies. We’ve made DMs feel like DMs again, removing them from the timeline and putting them in a dedicated chat space within our apps. For replies, we’ve added threads in the main timeline, re-injecting posts with new replies back into the chronological timeline and letting users see the conversation as they scroll. 

### Integrations with other services (some)

Our apps integrate with the platforms our clients already use. This lets us pull content like news articles from Ghost, podcasts from WordPress, videos from YouTube, or directories from CiviCRM. 

## Additional Features Enabled by the Dashboard

### Advanced Accounts Management

Through advanced account management, we can manage access to certain app features and spaces based on membership status and role.

### Channels & Custom Feeds

Connecting our client communities with the wider Social Web, our Channels allow app users to interact with topical feeds across federated Social Web platforms. We can build custom Channels for the needs of an existing community, or connect them to an expanding network of topical Channels built by our team or members of the community. 

### Groups

Using our Channel technology, we can build spaces dedicated to the discussion. These are effectively empty rooms with people gathering to talk about a shared interest, workstream, or to post updates. They can be federated with the wider Social Web, but we tend to keep them focused locally.

### Content Filters

Digital spaces come with multiple moderation challenges. To try and reduce these, we have hundreds of filters to prevent potentially harmful content from the wider Social Web federating into our servers. We work with our client partners to customise these lists based on their specific community needs. 
