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

def query_foursquare
  uri = URI.parse("https://api.foursquare.com/v2/venues/explore")
  request = Net::HTTP::Get.new(uri)
  request.set_form_data(
    "client_id" => ENV['FOURSQ_ID'],
    "client_secret" => ENV['FOURSQ_KEY'],
    "ll" => "40.7243,-74.0018",
    "query" => "coffee",
    "v" => "20180323",
  )

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  Curl::Easy.http_get()

end
