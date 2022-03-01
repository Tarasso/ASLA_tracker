class AddEventcodeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_code, :integer
  end
end
