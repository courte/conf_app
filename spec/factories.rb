FactoryGirl.define do
	factory :user do
		# first_name						"Jadzia"
		# last_name							"Dax"
		# email									"JadziaDax@DeepSpace9.com"
		
		sequence(:first_name)	{ |n| "First#{n}" }
		sequence(:last_name)	{ |n| "LastName #{n}" }
		sequence(:email)			{ |n| "person_#{n}@example.com"}
		password							"foobar00"
		password_confirmation	"foobar00"
	end

	factory :meeting do
		name 						"Title"
		location				"Here, There, Everywhere"
		description			"This meeting blah blah blah blah blah."
		start_time			Time.now
		end_time				Time.now + 3.hours + 30.minutes
	end
end