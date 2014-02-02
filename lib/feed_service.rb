#!/usr/bin/env ruby

class FeedService
  def initialize settings
    @blog_rss = settings['blog']['rss']
  end
end
