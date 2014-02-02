#!/usr/bin/env ruby

require 'net/http'
require 'uri'

class LivedoorReader < FeedService
  def subscribers
    api_uri = 'http://rpc.reader.livedoor.com/count?feedlink=' + @blog_rss
    Net::HTTP.get(URI.parse api_uri).to_i
  end
end
