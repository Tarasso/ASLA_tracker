class AddProgramLevelToStudentMember < ActiveRecord::Migration[6.1]
  def change
    add_column :student_members, :program_level, :integer
  end
end
