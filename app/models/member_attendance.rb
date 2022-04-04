# frozen_string_literal: true

class MemberAttendance < ApplicationRecord
  belongs_to :event
  belongs_to :student_member
  enum point_type: { meeting: 0, social: 1, informational: 2, fundraising: 3 }
  validates :student_member_id, presence: true
  validates :event_id, presence: true
  validates :point_type, presence: true
end
