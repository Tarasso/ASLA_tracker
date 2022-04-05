# frozen_string_literal: true

json.extract!(event_student_member, :id, :student_member_id, :event_id, :created_at, :updated_at)
json.url(event_student_member_url(event_student_member, format: :json))
