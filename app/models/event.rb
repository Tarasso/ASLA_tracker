# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :student_member
  has_many :business_professional
  has_many :event_student_member
  has_many :event_business_professional
  has_many :member_attendance
  has_many :business_attendance
  enum event_type: { meeting: 0, social: 1, informational: 2, fundraising: 3 }
  validates :date, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :description, presence: true
  validates :event_type, presence: true
end
