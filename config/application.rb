require_relative 'boot'

require 'rails/all'
require 'net/http'
require 'uri'
require 'curb'
require 'json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Groupproject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

$feeling = {
  "happy": {
    "music": "cheerful",
    "event": "cheerful",
    "color": "yellow",
    "photo": "joy"
  },
  "jovial": {
    "music": "cheerful",
    "event": "laughs",
    "color": "yellow",
    "photo": "happy"
  }
}


def mood(string)
  # truncates any mood*.png into mood*
  return string.split(".")[0]
end

def query_foursquare(query, location)
  # event call for foursquare
  curl = Curl::Easy.new
  curl.url = Curl::urlalize("https://api.foursquare.com/v2/venues/explore", params = {
    "client_id": ENV['FOURSQ_ID'],
    "client_secret": ENV['FOURSQ_KEY'],
    "ll": location,
    "query": query,
    "v": "20180323",
    "limit": 1
    })
  curl.perform
  data = JSON.parse(curl.body_str)
  return data['response']
end

def query_unsplash(query, orientation)
  # photo call for unsplash
  curl = Curl::Easy.new
  curl.url = Curl::urlalize("https://api.unsplash.com/photos/random", params = {
    "client_id": ENV['UNSPLASH_ID'],
    "Accept-Version": "v1",
    "query": query,
    # landscape, portrait, or squarish
    "orientation": orientation
    })
  curl.perform
  data = JSON.parse(curl.body_str)
  return data
end
