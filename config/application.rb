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
    "photo": "joy",
    "poem": ["To Mrs M. B. on Her Birthday", "Etude Realiste", "Babyhood", "Not A Child", "A Ninth Birthday", "Life", "A Birthday", "Apparitions", "\"Hope\" is the thing with feathers", "Marriage Bells"]
  },
  "jovial": {
    "music": "cheerful",
    "event": "laughs",
    "color": "yellow",
    "photo": "happy",
    "poem": ["Paris", "Juvenilia", "To Mrs M. B. on Her Birthday", "Nephelidia", "Safety-Clutch", "Apparitions"]
  },
  "friendly": {
    "music": "cheerful",
    "event": "bars",
    "color": "peach",
    "photo": "friends",
    "poem": ["Paris", "Epistle to Mrs Teresa Blount.", "Life", "Apparitions"]
  },
  "content": {
    "music": "peaceful",
    "event": "park",
    "color": "baby blue",
    "photo": "tranquil",
    "poem": ["Under the Greenwood Tree", "Sonnet 74", "Paris, To Mrs M. B. on Her Birthday.", "Ode on Solitude.", "Etude Realiste", "Babyhood", "Not A Child", "A Ninth Birthday", "A Birthday", "Amoretti LXXIV: Most Happy Letters", "Sonnet 32 - The first time that the sun rose on thine oath", "\"Hope\" is the thing with feathers", "Marriage Bells"]
  },
  "flirty": {
    "music": "sexy",
    "event": "bars",
    "color": "red",
    "photo": "romance",
    "poem": ["Love Sonnets", "Fragments", "Paris", "Epistle to Miss Blount", "With the Works of Voiture.", "Epistle to Mrs Teresa Blount.  on Her Leaving the Town After the Coronation.", "To Mr C.", "St James's Place.", "Song To Celia - II", "The Passionate Shepherd To His Love", "On My Wife's Birth-Day", "Amoretti LXXV: One Day I Wrote Her Name", "Summum Bonum"]
  },
  "peaceful": {
    "music": "chill",
    "event": "peaceful",
    "color": "blue",
    "photo": "calm",
    "poem": ["Sonnet 74", "Juvenilia", "The Deserted Garden", "Ode on Solitude.", "Etude Realiste", "Not A Child", "A London Plane-Tree", "Speak Of The North! A Lonely Moor", "'Tis moonlight, summer moonlight", "Tall Nettles", "The words the happy say", "\"Hope\" is the thing with feathers"]
  },
  "loving": {
    "music": "romance",
    "event": "date spot",
    "color": "pink",
    "photo": "love",
    "poem": ["Love Sonnets", "Sonnet 74", "Epitaph. on Two Lovers Struck Dead by Lightning.", "Book IV. Ode I. to Venus.", "Autumn.", "Winter.", "Epistle to Miss Blount, With the Works of Voiture.", "Etude Realiste", "Not A Child", "A Ninth Birthday", "The Dream", "A Letter to Her Husband", "Song To Celia - II", "A Birthday", "The Passionate Shepherd To His Love", "On My Wife's Birth-Day", "Amoretti LXXIV: Most Happy Letters", "Amoretti LXXV: One Day I Wrote Her Name", "Sonnet 32 - The first time that the sun rose on thine oath", "Marriage Bells"]
  },
  "alluring": {
    "music": "seductive",
    "event": "romantic",
    "color": "pink",
    "photo": "seductive",
    "poem": ["Love Sonnets", "Fragments", "Paris", "Epistle to Miss Blount, With the Works of Voiture.", "Epistle to Mrs Teresa Blount.  on Her Leaving the Town After the Coronation.", "The Passionate Shepherd To His Love", "On My Wife's Birth-Day", "Amoretti LXXV: One Day I Wrote Her Name", "Summum Bonum"]
  },
  "silly": {
    "music": "silly",
    "event": "quirky",
    "color": "orange",
    "photo": "silly",
    "poem": ["To Mr C.", "St James's Place.", "Safety-Clutch"]
  },
  "studious": {
    "music": "focus",
    "event": "study",
    "color": "blue",
    "photo": "books",
    "poem": ["Epitaph.", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey.", "Nephelidia"]
  },
  "cool": {
    "music": "pop",
    "event": "hip",
    "color": "blue",
    "photo": "cool",
    "poem": ["Ode on Solitude.", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey.", "Nephelidia"]
  },
  "starstruck": {
    "music": "pop",
    "event": "famous",
    "color": "yellow",
    "photo": "famous",
    "poem": ["Fragments", "Paris", "Juvenilia", "Book IV. Ode I. to Venus.", "Epistle to Mrs Teresa Blount.  on Her Leaving the Town After the Coronation.", "Nephelidia", "A Wall Flower", "On My Wife's Birth-Day", "Amoretti LXXIV: Most Happy Letters", "Amoretti LXXV: One Day I Wrote Her Name", "Success is counted sweetest", "Success", "The Starlight Night"]
  },
  "party": {
    "music": "party",
    "event": "gathering",
    "color": "yellow",
    "photo": "party",
    "poem": ["To Mrs M. B. on Her Birthday.", "To Mr C.", "St James's Place."]
  },
  "crafty": {
    "music": "sexy",
    "event": "flirt",
    "color": "red",
    "photo": "seduction",
    "poem": ["Artemisia.", "Phryne.", "Epistle to Mrs Teresa Blount.  on Her Leaving the Town After the Coronation.", "To Mr C.", "St James's Place.", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey.", "The Passionate Shepherd To His Love"]
  },
  "annoyed": {
    "music": "annoyed",
    "event": "home",
    "color": "pink",
    "photo": "annoyed",
    "poem": ["Rival Sonnets", "The Alley", "Artemisia.", "Phryne.", "To Mr John Moore, Author of the Celebrated Worm-Powder.", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey.", "Home:abs", "Love and Friendship"]
  },
  "remorseful": {
    "music": "sorry",
    "event": "contemplative",
    "color": "gray",
    "photo": "tranquil",
    "poem": ["A Lover's Complaint", "Spring:abs", "Autumn:abs", "Winter:abs", "To Mr John Moore, Author of the Celebrated Worm-Powder", "The Dying Christian to His Soul", "On the Death of Robert Browning", "A Wall Flower", "Life:abs", "Later life", "I Built Myself a House of Glass", "Sympathy", "Loss And Gain"]
  },
  "workout": {
    "music": "workout",
    "event": "exercise",
    "color": "red",
    "photo": "fitness",
    "poem": []
  },
  "pain": {
    "music": "hurt",
    "event": "bars",
    "color": "gray",
    "photo": "sadness & pain",
    "poem": ["Dark Lady Sonnets", "Rival Sonnets", "Epitaph. on Two Lovers Struck Dead by Lightning", "To Mr John Moore, Author of the Celebrated Worm-Powder", "The Dying Christian to His Soul", "On the Death of Robert Browning", "Sorrow:abs", "The Lost Friend", "Life:abs", "Hope:abs", "Bridal Ballad", "I Built Myself a House of Glass", "Sympathy", "Loss And Gain"]
  },
  "hurt": {
    "music": "hurt",
    "event": "peaceful",
    "color": "beige",
    "photo": "pain",
    "poem": ["Dark Lady Sonnets", "Rival Sonnets", "Ode in Memory of the American Volunteers Fallen for France", "To Mr John Moore, Author of the Celebrated Worm-Powder", "On the Death of Robert Browning", "The Lost Friend", "A Farewell", "A Prayer", "Life:abs", "Hope:abs", "Later life", "Bridal Ballad", "Loss And Gain"]
  },
  "distress": {
    "music": "help",
    "event": "stress relief",
    "color": "red",
    "photo": "help",
    "poem": ["I Have A Rendezvous With Death", "Epistle to Mrs Teresa Blount.  on Her Leaving the Town After the Coronation", "On the Death of Robert Browning", "Sorrow:abs", "The Lost Friend", "Life:abs", "Hope:abs", "Loss And Gain"]
  },
  "furious": {
    "music": "anger",
    "event": "solitude",
    "color": "red",
    "photo": "furious",
    "poem": ["Artemisia", "Phryne", "To Mr John Moore, Author of the Celebrated Worm-Powder", "Hope:abs", "Later life", "Bridal Ballad"]
  },
  "explicit": {
    "music": "explicit",
    "event": "nightlife",
    "color": "red",
    "photo": "fuck",
    "poem": ["Fragments:abs", "Paris:abs", "To Mr John Moore, Author of the Celebrated Worm-Powder", "To Mr C", "St James's Place", "Lorraine"]
  },
  "mindblown": {
    "music": "psychedelic",
    "event": "mindblowing",
    "color": "magenta",
    "photo": "funky",
    "poem": ["Fragments", "Paris", "Juvenilia", "The Deserted Garden", "Epitaph:abs", "Nephelidia", "Freedom:abs", "A Dream Within A Dream"]
  },
  "bashful": {
    "music": "shy person",
    "event": "bashful",
    "color": "green",
    "photo": "shy",
    "poem": ["Love Sonnets", "To Mr C", "St James's Place", "Not A Child", "The Passionate Shepherd To His Love"]
  },
  "freezing": {
    "music": "cold weather",
    "event": "warm",
    "color": "blue",
    "photo": "cold",
    "poem": ["Winter:abs", "Blow, Blow, Thou Winter Wind", "Sonnet 30 (Fire And Ice)", "But These Things Also"]
  },
  "horrified": {
    "music": "spooky",
    "event": "horror",
    "color": "black",
    "photo": "spooky",
    "poem": ["Dark Lady Sonnets", "Death Sonnets", "Artemisia", "To Mr John Moore, Author of the Celebrated Worm-Powder", "The Dying Christian to His Soul", "Lorraine", "I felt a Funeral, in my Brain"]
  },
  "worried": {
    "music": "worry",
    "event": "worry",
    "color": "blue",
    "photo": "worry",
    "poem": ["Rival Sonnets", "I Have A Rendezvous With Death", "The Dying Christian to His Soul", "On the Death of Robert Browning", "The Lost Friend", "Dreams:abs", "Life:abs", "Love and Friendship", "Later life", "I Built Myself a House of Glass", "Loss And Gain"]
  },
  "gleeful": {
    "music": "glee",
    "event": "upbeat",
    "color": "yellow",
    "photo": "cheer",
    "poem": ["Paris:abs", "Juvenilia", "Book IV. Ode I. to Venus", "Epistle to Mrs Teresa Blount.  on Her Leaving the Town After the Coronation", "Etude Realiste", "Babyhood", "Nephelidia", "Life:abs", "A Birthday:abs", "The Passionate Shepherd To His Love", "On My Wife's Birth-Day", "Marriage Bells"]
  },
  "thoughtful": {
    "music": "contemplate",
    "event": "ponder",
    "color": "green",
    "photo": "thoughtful",
    "poem": ["Ode in Memory of the American Volunteers Fallen for France", "Fragments", "The Deserted Garden", "Epitaph:abs", "Part of the Ninth Ode of the Fourth Book", "Ode on Solitude", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey", "On the Death of Robert Browning", "Freedom:abs", "A Dream Within A Dream", "My life has been the poem"]
  },
  "nervous": {
    "music": "nervous",
    "event": "calm",
    "color": "gray",
    "photo": "nervous",
    "poem": ["I Have A Rendezvous With Death", "An Exile's Farewell", "Safety-Clutch", "A Wall Flower", "Love and Friendship", "A Dream Within A Dream", "Bridal Ballad", "I felt a Funeral, in my Brain", "Loss And Gain"]
  },
  "disdain": {
    "music": "hate",
    "event": "ugh",
    "color": "red",
    "photo": "hate",
    "poem": ["Rival Sonnets", "The Alley", "Artemisia", "Phryne", "To Mr John Moore", "Author of the Celebrated Worm-Powder", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey", "Love and Friendship", "Later life", "Bridal Ballad"]
  },
  "shocked": {
    "music": "surprise",
    "event": "shocking",
    "color": "yellow",
    "photo": "surprise",
    "poem": ["Artemisia", "Phryne", "Nephelidia", "Lorraine", "A Dream Within A Dream", "I felt a Funeral, in my Brain"]
  },
  "sleepy": {
    "music": "sleep",
    "event": "home",
    "color": "sky blue",
    "photo": "peace",
    "poem": ["Ode on Solitude", "A Ballad of Dreamland", "The Moon Maiden's Song", "The Moon:abs"]
  },
  "rich": {
    "music": "wealthy",
    "event": "extravagant",
    "color": "green",
    "photo": "extravagant",
    "poem": ["Fragments:abs", "To Mrs M. B. on Her Birthday", "Safety-Clutch", "Success is counted sweetest", "Success:abs"]
  },
  "wicked": {
    "music": "evil",
    "event": "wicked",
    "color": "purple",
    "photo": "evil",
    "poem": ["Dark Lady Sonnets", "Death Sonnets", "I Have A Rendezvous With Death", "To Mr John Moore, Author of the Celebrated Worm-Powder", "To Mr C", "St James's Place", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey", "Safety-Clutch", "There Is No God", "the Wicked Sayeth", "Lorraine"]
  },
  "poopy": {
    "music": "poop",
    "event": "poop",
    "color": "brown",
    "photo": "frustrated",
    "poem": ["To Mr John Moore, Author of the Celebrated Worm-Powder", "Chaucer", "Epitaph. for One Who Would Not Be Buried in Westminster Abbey", "Nephelidia", "Lorraine", "Bridal Ballad", "Sonnet 30 (Fire And Ice)", "I Built Myself a House of Glass"]
  },
  "spooky": {
    "music": "spooky",
    "event": "scary",
    "color": "purple",
    "photo": "creepy",
    "poem": ["Dark Lady Sonnets", "Death Sonnets", "I Have A Rendezvous With Death", "Ode in Memory of the American Volunteers Fallen for France", "To Mr John Moore, Author of the Celebrated Worm-Powder", "The Dying Christian to His Soul", "On the Death of Robert Browning", "Lorraine", "A Dream Within A Dream", "Bridal Ballad", "A Thought For A Lonely Death-Bed", "I felt a Funeral in my Brain"]
  },
  "games": {
    "music": "video games",
    "event": "games",
    "color": "purple",
    "photo": "video game",
    "poem": []
  },
  "dance": {
    "music": "dance",
    "event": "dance",
    "color": "red",
    "photo": "dance",
    "poem": ["Paris", "A Wall Flower"]
  },
  "zen": {
    "music": "zen",
    "event": "yoga",
    "color": "beige",
    "photo": "calm",
    "poem": ["Orpheus with his lute made trees", "Sonnet 74", "Juvenilia", "Ode on Solitude", "Etude Realiste", "A London Plane-Tree", "Speak Of The North! A Lonely Moor", "'Tis moonlight, summer moonlight", "Tall Nettles", "The words the happy say"]
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

def poem(mood)
  return $feeling[mood.to_sym][:poem][rand($feeling[mood.to_sym][:poem].length)]
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
