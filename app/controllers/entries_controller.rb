class EntriesController < ApplicationController
  def create
    @entry = Entry.new(entry_params)
    @entry.save
    respond_to do |format|
      format.js
    end
  end

  def read
  end

  def delete
  end

  private

  def entry_params
    params.require(:entry).permit(:journal_id, :mood, :photo, :poem,  :event)
  end
end
