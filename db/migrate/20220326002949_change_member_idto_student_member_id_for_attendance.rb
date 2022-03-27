class ChangeMemberIdtoStudentMemberIdForAttendance < ActiveRecord::Migration[6.1]
  def change
    rename_column :member_attendances, :member_id, :student_member_id
  end
end
