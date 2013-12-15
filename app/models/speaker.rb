class Speaker < ActiveRecord::Base
	has_many :engagements, dependent: :destroy
	has_many :meetings, through: :engagements
	
	validates :name, presence: true
end
