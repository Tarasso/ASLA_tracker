class ChangeMemberIdToStudentMemberId < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_student_members, :member_id, :student_member_id
  end
end
