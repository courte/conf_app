# Woodrow Wilson Event App

This is an event management application for the Woodrow Wilson National Fellowship Foundation. The app is currently intended to host one event at a time, but the hope is to expand it to a full-fledged event management system for multiple departments/programs.

Please feel free to fork it for use at your own organization.


### Dependences
* Ruby 1.9.3
* Rails 3.2.16
* Sqlite3

If you need assistance loading these programs, I strongly recommend the step-by-step instructions included in the [Ruby on Rails Tutorial by Michael Hartl](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec-rubygems).

### Installation
Installation is typical to most simple Rails apps. Run each of these commands in the terminal:

    bundle install

    bundle exec rake db:create

    bundle exec rake db:populate

    rails s

Then find your local event app at [http://localhost:3000](http://localhost:3000).