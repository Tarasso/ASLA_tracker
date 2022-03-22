# frozen_string_literal: true

class EventStudentMember < ApplicationRecord
  validates :member_id, presence: true
  validates :event_id, presence: true
end
