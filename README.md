# Woodrow Wilson Event App

This is an event management application for the Woodrow Wilson National Fellowship Foundation, a higher education foundation that identifies top talent to solve the nation's most pressing problems.

The app is currently intended to host one event at a time, but the hope is to expand it to a full-fledged event management system for multiple departments/programs.

Please feel free to fork it for use at your own organization.


### Dependences
* Ruby 1.9.3
* Rails 3.2.16
* Sqlite3

If you need assistance installing these programs, I strongly recommend the step-by-step instructions included in the [Ruby on Rails Tutorial by Michael Hartl](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec-rubygems).

### Installation
Installation is typical to most simple Rails apps.

Then run each of these commands in the terminal:

1. Run `bundle install`.

2. Configure the app for your local database by copying *database.yml.sample* to *database.yml* and making any changes needed for your database setup.

3. `rake db:create`

4. `rake db:migrate`

5. `rake db:populate`

6. `rails s`

Then find your local event app at [http://localhost:3000](http://localhost:3000).
