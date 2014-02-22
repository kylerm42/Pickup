# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  event_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Attendee < ActiveRecord::Base
  validates :user_id, :event_id, presence: true
  validates :user_id, uniqueness: { scope: :event_id }

  belongs_to :user
  belongs_to :event
end
