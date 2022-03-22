# frozen_string_literal: true

class EventStudentMember < ApplicationRecord
    belongs_to :event
    belongs_to :student_member
end
