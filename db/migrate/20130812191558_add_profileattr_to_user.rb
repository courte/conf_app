class AddProfileattrToUser < ActiveRecord::Migration
  def change
    add_column :users, :employer, :string
    add_column :users, :bio, :text
    add_column :users, :current_project, :string
    add_column :users, :privacy, :boolean
  end
end
