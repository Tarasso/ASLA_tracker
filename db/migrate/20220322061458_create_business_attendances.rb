class CreateBusinessAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :business_attendances do |t|
      t.integer :organization_id
      t.integer :event_id

      t.timestamps
    end
  end
end
