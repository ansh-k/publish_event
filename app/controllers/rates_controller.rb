class RatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[like unlike]

  def like
    @event.upvote_from current_user
    render layout: false
  end

  def unlike
    @event.downvote_from current_user
    render layout: false
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
