require 'spec_helper'

describe User do
  before { @user = User.new(first_name: "Jadzia", last_name: "Dax", email: "Jadzia.Dax@DeepSpace9.com") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }

	context "when first_name is not present" do
		before { @user.first_name = "" }
		it { should_not be_valid }
	end

	context "when last_name is not present" do
		before { @user.last_name = "" }
		it { should_not be_valid }
	end

	context "when first_name is too long" do
		before { @user.first_name = 'a' * 51 }
		it { should_not be_valid}
	end

	context "when last_name is too long" do
		before { @user.last_name = 'a' * 51 }
		it { should_not be_valid }
	end

	context "when email is not present" do
		before { @user.email = "" }
		it { should_not be_valid}
	end

	# context "when email is already in database" do
	#		before do
	# 		user_with_same_email = @user.dup
	# 		user_with_same_email.email 

end
