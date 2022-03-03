# frozen_string_literal: true

class Event < ApplicationRecord
  enum event_type: { meeting: 0, social: 1, informational: 2, fundraising: 3 }
  validates :date, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :description, presence: true
  validates :event_type, presence: true
end
