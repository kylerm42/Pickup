class AttendeesController < ApplicationController
  before_action :require_login

  def create
    @attendee = Attendee.new
    @attendee.user_id = current_user.id
    @attendee.event_id = params[:event_id]

    if @attendee.save
      redirect_to event_url(params[:event_id])
    else
      flash.now[:errors] = ["Something fucked up"]
      redirect_to event_url(params[:event_id])
    end
  end

  def destroy
    @attendee = Attendee.find_by(event_id: params[:event_id], user_id: current_user.id)
    return if @attendee.nil?
    @attendee.destroy
    redirect_to event_url(params[:event_id])
  end

  private
    def require_login
      redirect_to event_url(params[:event_id]) unless logged_in?
    end

end
