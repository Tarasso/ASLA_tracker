# frozen_string_literal: true

class BusinessAttendance < ApplicationRecord
  validates :organization_id, presence: true
  validates :event_id, presence: true
end
