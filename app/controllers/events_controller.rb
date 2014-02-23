class EventsController < ApplicationController

  before_action :get_event, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html
  def index
    coords = session[:coords]
 #   @events = Event.near(coords, 2).paginate(:page => params[:page])
    @events = Event.paginate(:page => params[:page])
 
   # respond_to do |format|
#         format.html # index.html.erb
#         format.json { render json: @events}
#         format.js
#       end
#     # render 'index'
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

  end

  private
    def event_params
      params.require(:event).permit(:title, :address, :deets, :latitude, :longitude, :time, :date, :creator_id)
    end

    def get_event
      @event = Event.find(params[:id])
    end

end
