require 'net/http'
require 'uri'
require 'json'
require_relative 'social_service'

class Feedly < SocialService
  def subscribers
    api_uri = 'http://cloud.feedly.com/v3/feeds/feed%2F' + URI.escape(@blog_rss, ':/')
    JSON.parse(Net::HTTP.get(URI.parse(api_uri)))['subscribers']
  end
end
