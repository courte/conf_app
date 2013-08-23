class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :description
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
