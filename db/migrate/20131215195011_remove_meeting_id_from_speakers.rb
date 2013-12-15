class RemoveMeetingIdFromSpeakers < ActiveRecord::Migration
  def up
  	remove_column :speakers, :meeting_id
  	remove_index :speakers, name: :index_speakers_on_meeting_id_and_moderator
  end

  def down
  	add_column :speakers, :meeting_id
  	add_index :speakers, name: :index_speakers_on_meeting_id_and_moderator
  end
end
