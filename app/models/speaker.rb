class Speaker < ActiveRecord::Base
	belongs_to :meeting
	default_scope -> { order('meeting_id DESC') }
	
	validates :meeting_id, presence: true
	validates :name, presence: true
end
