class Meeting < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time

  validates :name, presence: true

  VALID_DATETIME_REGEX = /\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:[0]{2}\z/i
  validates :start_time,	presence: true,
  												format: { with: VALID_DATETIME_REGEX }
  validates :end_time,		presence: true,
  												format: { with: VALID_DATETIME_REGEX }

  def Meeting.length
  	:start_time - :end_time
  end
end
