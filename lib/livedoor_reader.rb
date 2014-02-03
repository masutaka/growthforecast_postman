require 'net/http'
require 'uri'
require_relative 'social_service'

class LivedoorReader < SocialService
  def subscribers
    api_uri = 'http://rpc.reader.livedoor.com/count?feedlink=' + @blog_rss
    Net::HTTP.get(URI.parse api_uri).to_i
  end
end
