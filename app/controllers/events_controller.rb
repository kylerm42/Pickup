class EventsController < ApplicationController

  before_action :get_event, only: [:show, :edit, :update, :destroy]

  def index
    coords = session[:coords]
    @events = Event.near(coords, 2)

    render 'index'
  end

  def show
    render 'show'
  end

  def edit
    render 'edit'
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to event_url(@event)
    else
      flash.now[:errors] = @event.errors.full_messages
      render :edit
    end
  end

  def new
    @event = Event.new
    render 'new'
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

  def friend_index
    @fb_friends = FbGraph::User.me(current_user.oauth_token).friends
    @friend_list = @fb_friends.map(&:identifier)
    @friends = User.where("uid IN (?)", @friend_list).includes(:attending_events)
    @events = @friends.map(&:attending_events).sort { |e1, e2| e1.time <=> e2.time }
  end

  private
    def event_params
      params.require(:event).permit(:title, :address, :deets, :latitude, :longitude, :time, :date, :creator_id)
    end

    def get_event
      @event = Event.find(params[:id])
    end

end
