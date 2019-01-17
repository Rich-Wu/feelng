require_relative 'boot'

require 'rails/all'
require 'net/http'
require 'httparty'
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
  },
  "friendly": {
    "music": "cheerful",
    "event": "bars",
    "color": "peach",
    "photo": "friends"
  },
  "content": {
    "music": "peaceful",
    "event": "park",
    "color": "baby blue",
    "photo": "tranquil"
  },
  "flirty": {
    "music": "sexy",
    "event": "bars",
    "color": "red",
    "photo": "romance"
  },
  "peaceful": {
    "music": "chill",
    "event": "peaceful",
    "color": "blue",
    "photo": "calm"
  },
  "loving": {
    "music": "romance",
    "event": "date spot",
    "color": "pink",
    "photo": "love"
  },
  "alluring": {
    "music": "seductive",
    "event": "romantic",
    "color": "pink",
    "photo": "seductive"
  },
  "silly": {
    "music": "silly",
    "event": "quirky",
    "color": "orange",
    "photo": "silly"
  },
  "studious": {
    "music": "focus",
    "event": "study",
    "color": "blue",
    "photo": "books"
  },
  "cool": {
    "music": "pop",
    "event": "hip",
    "color": "blue",
    "photo": "cool"
  },
  "starstruck": {
    "music": "pop",
    "event": "famous",
    "color": "yellow",
    "photo": "famous"
  },
  "party": {
    "music": "party",
    "event": "gathering",
    "color": "yellow",
    "photo": "party"
  },
  "crafty": {
    "music": "sexy",
    "event": "flirt",
    "color": "red",
    "photo": "seduction"
  },
  "annoyed": {
    "music": "annoyed",
    "event": "home",
    "color": "pink",
    "photo": "annoyed"
  },
  "remorseful": {
    "music": "sorry",
    "event": "contemplative",
    "color": "gray",
    "photo": "tranquil"
  },
  "workout": {
    "music": "workout",
    "event": "exercise",
    "color": "red",
    "photo": "fitness"
  },
  "pain": {
    "music": "hurt",
    "event": "bars",
    "color": "gray",
    "photo": "sadness & pain"
  },
  "hurt": {
    "music": "hurt",
    "event": "peaceful",
    "color": "beige",
    "photo": "pain"
  },
  "distress": {
    "music": "help",
    "event": "stress relief",
    "color": "red",
    "photo": "help"
  },
  "furious": {
    "music": "anger",
    "event": "solitude",
    "color": "red",
    "photo": "furious"
  },
  "explicit": {
    "music": "explicit",
    "event": "nightlife",
    "color": "red",
    "photo": "fuck"
  },
  "mindblown": {
    "music": "psychedelic",
    "event": "mindblowing",
    "color": "magenta",
    "photo": "funky"
  },
  "bashful": {
    "music": "shy person",
    "event": "bashful",
    "color": "green",
    "photo": "shy"
  },
  "freezing": {
    "music": "cold weather",
    "event": "warm",
    "color": "blue",
    "photo": "cold"
  },
  "horrified": {
    "music": "spooky",
    "event": "horror",
    "color": "black",
    "photo": "spooky"
  },
  "worried": {
    "music": "worry",
    "event": "worry",
    "color": "blue",
    "photo": "worry"
  },
  "gleeful": {
    "music": "glee",
    "event": "upbeat",
    "color": "yellow",
    "photo": "cheer"
  },
  "thoughtful": {
    "music": "contemplate",
    "event": "ponder",
    "color": "green",
    "photo": "thoughtful"
  },
  "nervous": {
    "music": "nervous",
    "event": "calm",
    "color": "gray",
    "photo": "nervous"
  },
  "disdain": {
    "music": "hate",
    "event": "ugh",
    "color": "red",
    "photo": "hate"
  },
  "shocked": {
    "music": "surprise",
    "event": "shocking",
    "color": "yellow",
    "photo": "surprise"
  },
  "sleep": {
    "music": "sleep",
    "event": "home",
    "color": "sky blue",
    "photo": "peace"
  },
  "rich": {
    "music": "wealthy",
    "event": "extravagant",
    "color": "green",
    "photo": "extravagant"
  },
  "wicked": {
    "music": "evil",
    "event": "wicked",
    "color": "purple",
    "photo": "evil"
  },
  "poopy": {
    "music": "poop",
    "event": "poop",
    "color": "brown",
    "photo": "frustrated"
  },
  "spooky": {
    "music": "spooky",
    "event": "scary",
    "color": "purple",
    "photo": "creepy"
  },
  "games": {
    "music": "video games",
    "event": "games",
    "color": "purple",
    "photo": "video game"
  },
  "dance": {
    "music": "dance",
    "event": "dance",
    "color": "red",
    "photo": "dance"
  },
  "zen": {
    "music": "zen",
    "event": "yoga",
    "color": "beige",
    "photo": "calm"
  }

}

def mood(string)
  # truncates any mood*.png into mood*
  return string.split(".")[0]
end

def music(mood)
  return $feeling[mood.to_sym][:music]
end

def event(mood)
  return $feeling[mood.to_sym][:event]
end

def color(mood)
  return $feeling[mood.to_sym][:color]
end

def photo(mood)
  return $feeling[mood.to_sym][:photo]
end

def query_foursquare(query, location)
  # event call for foursquare
  curl = Curl::Easy.new
  curl.url = Curl::urlalize("https://api.foursquare.com/v2/venues/explore", params = {
    "client_id": ENV['FOURSQ_ID'],
    "client_secret": ENV['FOURSQ_KEY'],
    "ll": location,
    "query": event(query),
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
    "query": photo(query),
    # landscape, portrait, or squarish
    "orientation": orientation
    })
  curl.perform
  data = JSON.parse(curl.body_str)
  return data
end

def query_spotify(query)
  id = ENV["SPOTIFY_ID"]
  secret = ENV["SPOTIFY_SECRET"]
  credentials = "#{id}:#{secret}"
  # encode the string to base 64
  enc = Base64.encode64(credentials)
  enc = enc.gsub(/\s+/,"")

  body = {
      "grant_type" => "client_credentials"
  }
  
  headers = {
      "Authorization" => "Basic #{enc}"
  }
  # make the post request with required body and header parameters
  response = HTTParty.post("https://accounts.spotify.com/api/token", :body => body, :headers => headers)     
  body = JSON.parse(response.body)
  # set the access token for future calls
  @client_access_token = body["access_token"]

  query = {
    "q" => query,
    "type" => "playlist",
    "limit"=> 50
  }

  user_headers = {
    "Authorization" => "Bearer #{helpers.current_spotify_user.access_token}"
  }
  search_response = HTTParty.get("https://api.spotify.com/v1/search", :query => query, :headers => user_headers)
  body = JSON.parse(search_response.body)
  puts body
  items = body["playlists"]["items"]
  
  playlists = []

  items.each do |item|  
    # Saving IDs to save space
    playlists << item
  end

  @playlist = playlists.sample
end

