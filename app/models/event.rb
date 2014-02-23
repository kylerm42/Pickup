# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  deets      :text
#  latitude   :float            not null
#  longitude  :float            not null
#  creator_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  address    :string(255)
#  date       :datetime
#

class Event < ActiveRecord::Base
  validates :title, :address, :date, :creator_id, presence: true
  geocoded_by :address
  after_validation :geocode

  has_many :attendees
  belongs_to :creator, foreign_key: :creator, class_name: "User"

  self.per_page = 3

  def time_around
    self.time.strftime("Around %I:%M %p")
  end

  def friend_events
    @fb_friends = FbGraph::User.me(current_user.oauth_token).friends
    @friend_list = @fb_friends.map(&:identifier)
    @friends = User.where("uid IN (?)", @friend_list).includes(:attending_events)
    @events = @friends.map(&:attending_events).flatten.sort { |e1, e2| e1.time <=> e2.time }
  end
end
