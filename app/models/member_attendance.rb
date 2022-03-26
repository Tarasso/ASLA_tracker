# frozen_string_literal: true

class MemberAttendance < ApplicationRecord
  belongs_to :event
  belongs_to :student_member
  validates :student_member_id, presence: true
  validates :event_id, presence: true
  validates :point_type, presence: true
end
