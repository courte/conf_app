class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  before_save { @user.email.downcase }

  validates :first_name, :presence => true, :length => { maximum: 50 }
  validates :last_name, :presence => true, :length => { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with, VALID_EMAIL_REGEX }

end
