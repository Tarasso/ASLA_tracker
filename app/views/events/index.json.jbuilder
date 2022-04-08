# frozen_string_literal: true

json.metadata do
  json.current_page(@events.current_page)
  json.total_pages(@events.total_pages)
  json.total_entries(@events.total_count)
  json.page_size(@page_size)
end

json.data do
  json.array!(@events) do |event|
    json.extract!(event, :id, :name, :location, :description, :event_type, :event_code)
    json.date(event.date.strftime('%B %-d, %Y'))
    json.time("#{event.start_time.strftime('%I:%M %p')}-#{event.finish_time.strftime('%I:%M %p')}")
    json.show_link(link_to('View', event_path(event), class: 'tabular-btn'))
    json.show_link1(link_to('Edit', edit_event_path(event), class: 'tabular-btn'))
    json.show_link2(link_to('Delete', event_path(event), method: :delete, data: { confirm: "Are you sure you want to delete the event: #{event.name}?" }, class: 'tabular-btn'))
  end
end
