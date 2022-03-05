class CreateEventStudentMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_student_members do |t|
      t.integer :member_id
      t.integer :event_id

      t.timestamps
    end
  end
end
