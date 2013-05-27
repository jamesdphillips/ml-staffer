class AddGTalkStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :gtalk_status, :string
  end
end
