class SocialService
  def initialize settings
    @blog_url = settings['blog']['url']
    @blog_rss = settings['blog']['rss']
  end
end
