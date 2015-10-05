class CreateWorkTimes < ActiveRecord::Migration
  def change
    create_table :work_times do |t|
      t.integer :user_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
