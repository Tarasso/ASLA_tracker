# frozen_string_literal: true

class MemberAttendance < ApplicationRecord
  validates :member_id, presence: true
  validates :event_id, presence: true
  validates :point_type, presence: true
end
