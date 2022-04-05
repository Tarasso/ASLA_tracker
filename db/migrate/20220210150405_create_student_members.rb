class CreateStudentMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :student_members do |t|
      t.string :uin
      t.string :first_name
      t.string :last_name
      t.string :class_year
      t.date :join_date
      t.integer :member_title
      t.string :email
      t.string :phone_number
      t.date :expected_graduation_date
      t.integer :social_point_amount
      t.integer :meeting_point_amount
      t.integer :fundraiser_point_amount
      t.integer :informational_point_amount
      t.string :officer_title
      t.boolean :dues_paid
      t.string :picture

      t.timestamps
    end
  end
end
