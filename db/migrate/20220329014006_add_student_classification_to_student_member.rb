class AddStudentClassificationToStudentMember < ActiveRecord::Migration[6.1]
  def change
    add_column :student_members, :student_classification, :integer
  end
end
