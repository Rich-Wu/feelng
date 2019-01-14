class PagesController < ApplicationController
  def home
    @mood = Mood.new
  end

  def results
    @mood = params['mood']
    p @mood
    # color API
    # music API
    # poetry API
    # event API
    render 'results'
  end
end
