class EventsController < ApplicationController

  before_action :get_event, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html
  def index
    coords = session[:coords]
    @events = Event.near(coords, 2).paginate(:page => params[:page])
  end

  def show
  end

  def edit
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
  end

  def create
    @event = Event.new(event_params)
    @event.date = @event.date.change({
      hour: params[:time][0..1].to_i,
      min: params[:time][3..4].to_i })
    @event.creator_id = current_user.id

    if @event.save
      Attendee.create!(user_id: current_user.id, event_id: @event.id)
      redirect_to event_url(@event)
    else
      flash.now[:errors] = @event.errors.full_messages
      render :new
    end
  end

  def destroy
    if @event.creator_id == current_user.id
      @event.destroy
      redirect_to events_url
    end
  end

  def friend_index
    @events = friend_events
  end


  private
    def event_params
      params.require(:event).permit(:title, :address, :deets, :latitude, :longitude, :date, :creator_id)
    end

    def get_event
      @event = Event.find(params[:id])
    end

    def friend_events
      fb_friends = FbGraph::User.me(current_user.oauth_token).friends
      friend_list = fb_friends.map(&:identifier)
      friends = User.where("uid IN (?)", friend_list).includes(:attending_events)
      events = friends.map(&:attending_events).flatten.sort { |e1, e2| e1.time <=> e2.time }
    end

end
