FactoryGirl.define do
	factory :user do
		first_name						"Jadzia"
		last_name							"Dax"
		email									"JadziaDax@DeepSpace9.com"
		password							"nerdAlert"
		password_confirmation	"nerdAlert"
	end

	factory :meeting do
		name 						"Title"
		location				"Here, There, Everywhere"
		description			"This meeting blah blah blah blah blah."
		start_time			Time.now
		end_time				Time.now + 3.hours + 30.minutes
	end
end