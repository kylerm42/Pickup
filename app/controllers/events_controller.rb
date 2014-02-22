class EventsController < ApplicationController

  before_action :get_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id

    if @event.save
      redirect_to event_url(@event)
    else
      flash.now[:errors] = @event.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:title, :deets, :latitude, :longitude, :time, :date, :creator_id)
  end

  def get_event
    @event = Event.find(params[:id])
  end

end
