#!/usr/bin/env ruby

require 'net/http'
require 'rexml/document'

class HatenaBookmark < FeedService
  def count
    # http://developer.hatena.ne.jp/ja/documents/bookmark/apis/getcount#total
    request = <<EOS
<?xml version="1.0"?>
<methodCall>
  <methodName>bookmark.getTotalCount</methodName>
  <params>
    <param>
      <value><string>#{@blog_url}</string></value>
    </param>
  </params>
</methodCall>
EOS
    header = {'Content-Type' => 'text/xml; charset=utf-8', 'Content-Length' => request.bytesize.to_s}
    http = Net::HTTP.new 'b.hatena.ne.jp'
    http.start
    response = http.request_post '/xmlrpc', request, header
    doc = REXML::Document.new response.body
    doc.elements['/methodResponse/params/param/value/int'].text.to_i
  end
end
