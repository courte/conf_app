require 'spec_helper'

describe User do
  before { @user = User.new(first_name: "Jadzia", last_name: "Dax",
  													email: "Jadzia.Dax@DeepSpace9.com",
  													password: "nerdAlert",
  													password_confirmation: "nerdAlert") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

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

	context "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
										 foo@bar_baz.com foo@bar+baz.com foo@bar..com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	context "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	context "when email is already in database" do
		before do
			user_with_same_email = @user.dup
	 		user_with_same_email.email = @user.email.upcase
	 		user_with_same_email.save
	 	end

	 	it { should_not be_valid }
	end

	context "when email address is mixed case" do
		let(:mixed_case_email) { "FooBar@exAMPle.COM" }

		it "should be saved as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			expect(@user.reload.email).to eq mixed_case_email.downcase
		end
	end

	context "when password is not present" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end

	context "when password is too short" do
		before { @user.password = @user.password_confirmation = "a" * 7 }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }

		context "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		context "with invalid password" do
			let (:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end
end
