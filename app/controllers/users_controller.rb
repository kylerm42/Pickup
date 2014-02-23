class UsersController < ApplicationController

  def show
    @events = Event.where(:creator_id => current_user.id)
    render 'show'
  end

  def attending
    @attending = current_user.attending_events
  end


end
