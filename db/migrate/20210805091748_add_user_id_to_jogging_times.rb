class AddUserIdToJoggingTimes < ActiveRecord::Migration[6.1]
  def change
    add_column :jogging_times, :user_id, :integer
    add_index :jogging_times, :user_id
  end
end
