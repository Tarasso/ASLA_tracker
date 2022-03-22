# frozen_string_literal: true

json.extract!(member_attendance, :id, :member_id, :event_id, :point_type, :created_at, :updated_at)
json.url(member_attendance_url(member_attendance, format: :json))
