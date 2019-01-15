class PagesController < ApplicationController
  def home
    render 'home'
  end

  def results
    @mood = params['mood']
    p @mood
    # color API
    # music API
    # Setting up the query params to gain the user's access token
    
    # poetry API
    # event API
    render 'results'
  end


end

