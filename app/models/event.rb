# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)      not null
#  deets         :text
#  latitude      :float            not null
#  longitude     :float            not null
#  creator_id    :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#  address       :string(255)
#  date          :datetime
#  people_needed :integer          not null
#

class Event < ActiveRecord::Base
  validates :title, :address, :date, :creator_id, :latitude, :longitude, :people_needed, presence: true
  geocoded_by :address
  before_validation :geocode

  has_many :attendees
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"

  self.per_page = 3

  ADVICE =[
    "Don't forget to bring a towel!",
    "Don't forget to have fun!",
    "Did your mother say it was okay?",
    "Some people have all the fun!",
    "Good things come to those who wait (until the last minute).",
    "Better than sitting around, I guess.",
    "What are you gonna miss, TV?",
    "What else would you be doing?"
  ]

  def weekday
    self.date.strftime("%A")
  end

  def time_around
    self.date.strftime("Around %H:%M %p")
  end

end
