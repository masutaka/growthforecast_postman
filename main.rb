#!/usr/bin/env ruby

require 'yaml'
Dir['lib/*.rb'].each {|f| require_relative f}

settings_yml = File.join __dir__, 'settings.yml'
settings = YAML.load open settings_yml

gf = GrowthForecast.new settings
gf.post_feedly Feedly.new(settings).subscribers
gf.post_livedoor_reader LivedoorReader.new(settings).subscribers
