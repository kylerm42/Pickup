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
end
