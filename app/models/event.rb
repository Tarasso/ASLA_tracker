class Event < ApplicationRecord
    enum event_type: [:meeting, :social, :informational, :fundraising]
end
