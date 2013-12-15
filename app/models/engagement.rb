class Engagement < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :meeting

  validates :speaker_id, presence: true
  validates :meeting_id, presence: true
end
