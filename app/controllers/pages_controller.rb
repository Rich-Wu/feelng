class PagesController < ApplicationController
  def home
    render 'home'
  end

  def results
    @mood = params['mood']
    # photo API
    @photo = query_unsplash(mood(params['mood']),"portrait")
    p @photo
    # color API

    # music API
    # poetry API
    # event API
    @event = query_foursquare(mood(params['mood']),params['coordinates'])
    p @event
    render 'results'
  end
end
