class AddFacebookProvider < ActiveRecord::Migration
  def up
    add_column :users, :fb_uid, :string
    add_column :users, :fb_key, :string
  end

  def down
  end
end
