class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		# if saved
  	else
  		# redirect_to user#new
  	end
  end

  def show
  end


  private
   
    # Requires that :user be a key in the params Hash and
 		# only accept :name, :email, :password, and :password_confirmation attr
  	def user_params
  		params.require(@user).permit(:first_name, :last_name, :email,
  																 :password, :password_confirmation)
  	end
end
