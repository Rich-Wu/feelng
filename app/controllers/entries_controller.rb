class EntriesController < ApplicationController
  def create
    @entry = Entry.new(entry_params)
    @entry.save
    respond_to do |format|
      format.js
    end
  end

  def read
    entry = Entry.find(params[:id])
    @mood = entry['mood']
    # photo API
    @photo = photo_by_id(entry['photo'])
    # music API

    # poetry API
    @poem = poem_by_title(entry['poem'])
    # event API
    @event = event_by_id(entry['event'])
    # journal content
    @content = entry['content']
  end

  def delete
  end

  private

  def entry_params
    params.require(:entry).permit(:journal_id, :mood, :photo, :poem,  :event, :content)
  end
end
