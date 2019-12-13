# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in, only: %i[new create]
  def new
    @event = Event.new
  end

  def create
    @creator = User.find(session[:user_id])
    @event = @creator.created_events.build(event_params)
    if @event.save
      redirect_to users_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def index
    @upcoming_events = Event.upcoming
    @prev_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :description)
  end
end
