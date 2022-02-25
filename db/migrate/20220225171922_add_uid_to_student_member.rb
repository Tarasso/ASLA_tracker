class AddUidToStudentMember < ActiveRecord::Migration[6.1]
  def change
    add_column :student_members, :uid, :string
  end
end
