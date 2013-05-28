class AddLocationUpdateExternalId < ActiveRecord::Migration
  def change
    change_table :location_updates do |t|
      t.string :external_id
    end
  end
end
