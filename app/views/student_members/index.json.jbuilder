# frozen_string_literal: true

json.metadata do
  json.current_page(@student_members.current_page)
  json.total_pages(@student_members.total_pages)
  json.total_entries(@student_members.total_count)
  json.page_size(@page_size)
end

json.data do
  json.array!(@student_members) do |student_member|
    json.extract!(student_member, :id, :first_name, :last_name, :member_title, :class_year, :email, :program_level, :expected_graduation_date, :social_point_amount, :meeting_point_amount, :fundraiser_point_amount, :informational_point_amount, :dues_paid)
    json.show_link(link_to('View', student_member_path(student_member), class: 'tabular-btn'))
    json.show_link1(link_to('Edit', edit_student_member_path(student_member), class: 'tabular-btn'))
    json.show_link2(link_to('Delete', student_member_path(student_member), method: :delete,
                                                                           data: { confirm: "Are you sure you want to delete the student: #{student_member.first_name} #{student_member.last_name}?" }, class: 'tabular-btn'
    )
                   )
  end
end
