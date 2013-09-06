namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(first_name: "Example",
								 last_name: "User",
								 email: "example.user@example.com",
								 password: "foobar00",
								 password_confirmation: "foobar00",
								 admin: true)
		99.times do |n|
			first_name = Faker::Name.first_name
			last_name  = Faker::Name.last_name
			email			 = "example-#{n+1}@example.com"
			password 	 = "foobar00"

			User.create!(first_name: 	first_name,
									 last_name: 	last_name,
									 email: 			email, 
									 password: 		password,
									 password_confirmation: password)
		end

		Meeting.create!(title: "Meeting Title",
										location: "There",
										description: "blahblah",
										start_time: Time.parse("2014-02-06 07:00"),
										end_time: Time.parse("2014-02-06 08:00") )
		20.times do |n|
			title = "Meeting Title #{n+1}"
			location = "There #{n+1}"
			description = Faker::Lorem.paragraph
			start_time = ( Time.parse("2014-02-06 07:00") + n.hours)
			end_time = ( Time.parse("2014-02-06 07:00") + 1.hour + n.hours )

			Meeting.create!(title: title,
											location: location,
											description: description,
											start_time: start_time,
											end_time: end_time)
		end
	end
end