json.metadata do
  json.current_page  @event_student_members.current_page
  json.total_pages   @event_student_members.total_pages
  json.total_entries @event_student_members.total_count
  json.page_size     @page_size
end

json.data do
  json.array! @event_student_members do |event_student_member|
    json.extract! event_student_member, :id,  :name, :first_name, :uin, :last_name, :email, :date
    json.show_link link_to('View', event_student_member_path(event_student_member), class: 'tabular-btn')
    json.show_link1 link_to('Edit', edit_event_student_member_path(event_student_member) , class: 'tabular-btn')
    json.show_link2 link_to('Destroy', event_student_member_path(event_student_member), method: :delete, data: { confirm: 'Are you sure?' }  , class: 'tabular-btn')
  end 
end

