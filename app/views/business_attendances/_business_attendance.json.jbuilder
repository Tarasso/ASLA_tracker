# frozen_string_literal: true

json.extract!(business_attendance, :id, :organization_id, :event_id, :created_at, :updated_at)
json.url(business_attendance_url(business_attendance, format: :json))
