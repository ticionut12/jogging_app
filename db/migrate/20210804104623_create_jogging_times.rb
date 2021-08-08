class CreateJoggingTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :jogging_times do |t|
      t.datetime :date
      t.float :distance
      t.time :total_time

      t.timestamps
    end
  end
end
