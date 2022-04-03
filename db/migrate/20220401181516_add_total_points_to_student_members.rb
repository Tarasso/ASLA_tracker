class AddTotalPointsToStudentMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :student_members, :total_points, :integer
  end
end
