class AddLocationAndDurationToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :location, :string
    add_column :meetings, :duration, :integer
  end
end
