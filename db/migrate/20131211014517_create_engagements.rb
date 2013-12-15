class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.integer :speaker_id
      t.integer :meeting_id

      t.timestamps
    end

    add_index :engagements, :speaker_id
    add_index :engagements, :meeting_id
    add_index :engagements, [:speaker_id, :meeting_id], :unique => true
  end
end
