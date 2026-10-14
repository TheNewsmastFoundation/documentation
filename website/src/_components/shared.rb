module Shared
  class Navbar < Bridgetown::Component
    attr_reader :metadata, :resource, :strategy

    # @param metadata [HashWithDotAccess::Hash]
    # @param resource [Bridgetown::Resource::Base]
    def initialize(metadata:, resource:)
      @metadata, @resource = metadata, resource

      @strategy = Willamette.navbar(
        self,
        logo: "/images/newsmast-logo.svg",
        logo_alt: "Website Logo",
        search: true,
        site_title: nil,
        nav_links: [
          Willamette.link(title: t("nav.docs"), url: "/docs"),
          Willamette.link(title: t("nav.blog"), url: "/blog"),
        ]
      )
    end
  end

  class Sidebar < Bridgetown::Component
    attr_reader :metadata, :resource, :strategy

    # @param metadata [HashWithDotAccess::Hash]
    # @param resource [Bridgetown::Resource::Base]
    def initialize(metadata:, resource:)
      @metadata, @resource = metadata, resource

      explore_links = if resource.is_a?(Bridgetown::Resource::Base) && resource.collection.label == "docs"
                        Willamette.links_for(resource)
                      end

      @strategy = Willamette.sidebar(
        self,
        description: metadata.description,
        explore_links:,
        follow_links: [
          Willamette.link(icon: "rss", title: "Newsfeed", url: "/feed.xml"),
          Willamette.link(icon: "mastodon", icon_family: "brands", title: "Mastodon", url: "https://newsmast.social/@newsmast"),
          Willamette.link(icon: "bluesky", icon_family: "brands", title: "Bluesky", url: "https://bsky.app/profile/newsmastfoundation.org"),
        ],
        subscribe: false,
        see_also_links: [
          Willamette.link(icon: "file-lines", title: "About Newsmast", url: "https://newsmastfoundation.org/about/"),
        ]
      )
    end
  end
end
