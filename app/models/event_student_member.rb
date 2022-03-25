# frozen_string_literal: true

class EventStudentMember < ApplicationRecord
  belongs_to :event
  belongs_to :student_member
  validates :student_member_id, presence: true
  validates :event_id, presence: true
end
