# frozen_string_literal: true

class BusinessAttendance < ApplicationRecord
  belongs_to :event
  belongs_to :business_professional
  validates :business_professional_id, presence: true
  validates :event_id, presence: true
end
