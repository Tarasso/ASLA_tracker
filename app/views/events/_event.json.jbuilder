json.extract! event, :id, :date, :name, :location, :start_time, :finish_time, :description, :event_type, :created_at, :updated_at
json.url event_url(event, format: :json)
