class AddLocationUpdateSource < ActiveRecord::Migration
  def change
    change_table :location_updates do |t|
      t.string :source
    end
  end
end
