# frozen_string_literal: true

json.metadata do
  json.current_page(@business_professionals.current_page)
  json.total_pages(@business_professionals.total_pages)
  json.total_entries(@business_professionals.total_count)
  json.page_size(@page_size)
end

json.data do
  json.array!(@business_professionals) do |business_professional|
    json.extract!(business_professional, :id, :first_name, :last_name, :org_name, :email)
    json.show_link(link_to('View', business_professional_path(business_professional), class: 'tabular-btn'))
    json.show_link1(link_to('Edit', edit_business_professional_path(business_professional), class: 'tabular-btn'))
    json.show_link2(link_to('Delete', business_professional_path(business_professional), method: :delete,
                                                                                         data: { confirm: "Are you sure you want to delete the professional: #{business_professional.first_name} #{business_professional.last_name}?" },
                                                                                         class: 'tabular-btn'
    )
                   )
  end
end
