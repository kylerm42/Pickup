class UsersController < ApplicationController
  def index
    @user = User.first
    @user2 = User.last
    @fb_friends = FbGraph::User.me(@user2.oauth_token).friends
  end

  def show
    @events = Event.where(:creator_id => current_user.id)
    render 'show'
  end

end
