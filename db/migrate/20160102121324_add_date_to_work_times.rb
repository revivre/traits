class AddDateToWorkTimes < ActiveRecord::Migration
  def change
    add_column :work_times, :work_date, :date, :after => :user_id
  end
end
