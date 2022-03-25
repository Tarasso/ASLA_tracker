# frozen_string_literal: true

class EventStudentMember < ApplicationRecord
<<<<<<< HEAD
    belongs_to :event
    belongs_to :student_member
=======
  validates :member_id, presence: true
  validates :event_id, presence: true
>>>>>>> dev
end
