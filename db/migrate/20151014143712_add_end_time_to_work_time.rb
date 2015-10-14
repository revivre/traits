class AddEndTimeToWorkTime < ActiveRecord::Migration
  def change
    add_column :work_times, :end_time, :datetime
  end
end
