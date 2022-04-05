# frozen_string_literal: true

json.extract!(event_business_professional, :id, :business_professional_id, :event_id, :created_at, :updated_at)
json.url(event_business_professional_url(event_business_professional, format: :json))
