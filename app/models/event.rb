# frozen_string_literal: true

class Event < ApplicationRecord
  enum event_type: { meeting: 0, social: 1, informational: 2, fundraising: 3 }
end
