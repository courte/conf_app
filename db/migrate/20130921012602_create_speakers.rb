class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string 	:name
      t.string 	:bio
      t.boolean :moderator
      t.integer :meeting_id
      t.integer :user_id, 	:default => nil

      t.timestamps
    end
    add_index :speakers, [:meeting_id, :moderator]
  end
end