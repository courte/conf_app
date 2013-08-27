class RenameNameToTitleInMeetings < ActiveRecord::Migration
  def change
  	rename_column :meetings, :name, :title
  end
end
