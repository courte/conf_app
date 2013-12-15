class Speaker < ActiveRecord::Base
	# belongs_to :meeting
	has_many :engagements
	has_many :meetings, through: :engagements
	default_scope -> { order('meeting_id DESC') }
	
	validates :meeting_id, presence: true
	validates :name, presence: true
end
