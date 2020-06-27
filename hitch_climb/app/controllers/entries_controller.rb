class EntriesController < ApplicationController
  before_action :authenticate_user!

  def create
    entry = current_user.entries.build(event_id: params[:event_id])
    entry.save
    redirect_to events_path
  end

  def destroy
    entry = Entry.find_by(event_id: params[:event_id], user_id: current_user.id)
    entry.destroy
    redirect_to events_path
  end
end

