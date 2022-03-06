# frozen_string_literal: true

class EventBusinessProfessional < ApplicationRecord
    validates :organization_id, presence: true
    validates :event_id, presence: true
end
