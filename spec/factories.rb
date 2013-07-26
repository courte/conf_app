FactoryGirl.define do
	factory :user do
		first_name						"Jadzia"
		last_name							"Dax"
		email									"JadziaDax@DeepSpace9.com"
		password							"nerdAlert"
		password_confirmation	"nerdAlert"
	end
end