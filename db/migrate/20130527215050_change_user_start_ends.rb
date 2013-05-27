class ChangeUserStartEnds < ActiveRecord::Migration
  def up
    change_column :users, :start_work_hour, :integer
    change_column :users, :end_work_hour, :integer
  end

  def down
    change_column :users, :start_work_hour, :datetime
    change_column :users, :end_work_hour, :datetime
  end
end
