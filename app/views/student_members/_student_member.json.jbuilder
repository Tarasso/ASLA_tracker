# frozen_string_literal: true

json.extract!(student_member, :id, :uin, :first_name, :last_name, :class_year, :join_date, :member_title, :email, :phone_number,
              :expected_graduation_date, :social_point_amount, :meeting_point_amount, :fundraiser_point_amount, :informational_point_amount,
              :officer_title, :dues_paid, :picture, :created_at, :updated_at
)
json.url(student_member_url(student_member, format: :json))
