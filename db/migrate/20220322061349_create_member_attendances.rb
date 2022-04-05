class CreateMemberAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :member_attendances do |t|
      t.integer :member_id
      t.integer :event_id
      t.integer :point_type

      t.timestamps
    end
  end
end
