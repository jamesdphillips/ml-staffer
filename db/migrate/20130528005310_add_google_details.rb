class AddGoogleDetails < ActiveRecord::Migration
  def up
    add_column :users, :google_uid, :string
    add_column :users, :google_key, :string
  end

  def down
  end
end
