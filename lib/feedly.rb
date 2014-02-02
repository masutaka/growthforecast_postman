#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

class Feedly < FeedService
  def subscribers
    api_uri = 'http://cloud.feedly.com/v3/feeds/feed%2F' + URI.escape(@blog_rss, ':/')
    JSON.parse(Net::HTTP.get(URI.parse(api_uri)))['subscribers']
  end
end
