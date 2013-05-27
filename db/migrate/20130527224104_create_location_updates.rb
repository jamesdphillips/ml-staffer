class CreateLocationUpdates < ActiveRecord::Migration
  def change
    create_table :location_updates do |t|
      t.integer :user_id
      t.decimal :latitude, :precision => 10, :scale => 6
      t.decimal :longitude, :precision => 10, :scale => 6
      t.decimal :accuracy, :precision => 10, :scale => 6
      t.timestamps
    end
  end
end
