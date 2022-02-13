class ChangeTimeOnEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :time, :start_time
    add_column :events, :finish_time, :time
  end
end
