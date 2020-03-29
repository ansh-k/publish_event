class WelcomeController < ApplicationController
  def index
    @events = Event.paginate(page: params[:page], per_page: 30)
    render 'events/index'
  end
end
