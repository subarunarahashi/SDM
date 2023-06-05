class CreateWorkTests < ActiveRecord::Migration[7.0]
  def change
    create_table :work_tests do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :actual_working_time

      t.timestamps
    end
  end
end
