class AddLocationUpdateName < ActiveRecord::Migration
  def change
    change_table :location_updates do |t|
      t.string :name
    end
  end
end
