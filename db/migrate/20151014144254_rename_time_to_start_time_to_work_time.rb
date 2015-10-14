class RenameTimeToStartTimeToWorkTime < ActiveRecord::Migration
  def change
    rename_column :work_times, :time, :start_time
  end
end
