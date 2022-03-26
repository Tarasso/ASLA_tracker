# frozen_string_literal: true

json.metadata do
  json.current_page(@member_attendances.current_page)
  json.total_pages(@member_attendances.total_pages)
  json.total_entries(@member_attendances.total_count)
  json.page_size(@page_size)
end

json.data do
  json.array!(@member_attendances) do |member_attendance|
    json.extract!(member_attendance, :id, :name, :first_name, :uin, :last_name, :email, :date)
    case member_attendance.point_type
    when 0
      json.point_type('meeting')
    when 1
      json.point_type('social')
    when 2
      json.point_type('informational')
    when 3
      json.point_type('fundraising')
    end
    json.show_link(link_to('View', member_attendance_path(member_attendance), class: 'tabular-btn'))
    json.show_link1(link_to('Edit', edit_member_attendance_path(member_attendance), class: 'tabular-btn'))
    json.show_link2(link_to('Destroy', member_attendance_path(member_attendance), method: :delete, data: { confirm: 'Are you sure you want to delete this attendence entry?' }, class: 'tabular-btn'))
  end
end
