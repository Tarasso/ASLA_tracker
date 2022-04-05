# frozen_string_literal: true

json.metadata do
  json.current_page(@event_business_professionals.current_page)
  json.total_pages(@event_business_professionals.total_pages)
  json.total_entries(@event_business_professionals.total_count)
  json.page_size(@page_size)
end

json.data do
  json.array!(@event_business_professionals) do |event_business_professional|
    json.extract!(event_business_professional, :id, :name, :first_name, :org_name, :last_name, :email, :date)
    json.show_link(link_to('View', event_business_professional_path(event_business_professional), class: 'tabular-btn'))
    json.show_link1(link_to('Edit', edit_event_business_professional_path(event_business_professional), class: 'tabular-btn'))
    json.show_link2(link_to('Destroy', event_business_professional_path(event_business_professional), method: :delete, data: { confirm: 'Are you sure you would like to delete this item?' },
                                                                                                      class: 'tabular-btn'
    )
                   )
  end
end
