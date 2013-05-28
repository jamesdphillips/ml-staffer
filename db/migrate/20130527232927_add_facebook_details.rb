class AddFacebookDetails < ActiveRecord::Migration
  def up
    add_column :users, :birthday, :date
    add_column :users, :location, :string
    add_column :users, :bio, :blob
  end

  def down
    remove_column :users, :birthday
    remove_column :users, :location
    remove_column :users, :bio
  end
end
