require 'spec_helper'

describe "StaticPages" do

	subject { page }
	
	describe "Home page" do
		before { visit root_path }

		it { should have_content('Welcome to the Woodrow Wilson Event app') }
		it { should have_title(full_title('')) }
		it { should_not have_title(' | Home') }
	end
end