class RemoveOfficerTitleFromStudentMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :student_members, :officer_title, :string
  end
end
