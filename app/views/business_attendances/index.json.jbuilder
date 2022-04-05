# frozen_string_literal: true

json.metadata do
  json.current_page(@business_attendances.current_page)
  json.total_pages(@business_attendances.total_pages)
  json.total_entries(@business_attendances.total_count)
  json.page_size(@page_size)
end

json.data do
  json.array!(@business_attendances) do |business_attendance|
    json.extract!(business_attendance, :id, :name, :first_name, :org_name, :last_name, :email, :date)
    json.show_link(link_to('View', business_attendance_path(business_attendance), class: 'tabular-btn'))
    json.show_link1(link_to('Edit', edit_business_attendance_path(business_attendance), class: 'tabular-btn'))
    json.show_link2(link_to('Destroy', business_attendance_path(business_attendance), method: :delete, data: { confirm: 'Are you sure you would like to delete this item?' }, class: 'tabular-btn'))
  end
end
