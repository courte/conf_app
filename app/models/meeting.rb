class Meeting < ActiveRecord::Base
  has_many :engagements, dependent: :destroy
  has_many :speakers, through: :engagements

  before_save :create_duration

  validates :title,     presence: true
  validates :location,  presence: true

  VALID_DATETIME_REGEX = /\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} [+-]*[\dA-z]{3,4}\z/
  validates :start_time,	presence: true,
  												format: { with: VALID_DATETIME_REGEX }
  # validates_is_after :start_time, :on => :create
  validates :end_time,		presence: true, 
  												format: { with: VALID_DATETIME_REGEX }
  validates_is_after :end_time, :after => :start_time

  def create_duration
  	self.duration = (self.end_time - self.start_time)
  end
end
