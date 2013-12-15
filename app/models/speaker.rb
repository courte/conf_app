class Speaker < ActiveRecord::Base
	has_many :engagements, dependent: :destroy
	has_many :meetings, through: :engagements
	
	validates :name, presence: true

	def scheduled?(meeting)
		engagements.find_by_meeting_id(meeting.id)
	end

	def schedule!(meeting)
		engagements.create!(meeting_id: meeting.id)
	end

	def unschedule!(meeting)
		engagements.find_by_meeting_id(meeting.id).destroy
	end
end
