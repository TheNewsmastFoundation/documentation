# plugins/builders/hooks.rb
class Builders::Hooks < SiteBuilder
  def build
    # Use the name of your collection for the first argument:
    hook :docs, :post_read do |resource|
      title = nil
      resource.content = resource.content.sub(%r!^# .*?$!) do |line|
        title = line.delete_prefix("# ")
        ""
      end
      resource.data.title = title if title
    end
  end
end
