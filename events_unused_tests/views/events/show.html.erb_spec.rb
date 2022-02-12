# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/show', type: :view) do
  before do
    @event = assign(:event, Event.create!(
                              name: 'Name',
                              location: 'Location',
                              description: 'Description',
                              event_type: 2
                            )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Name/))
    expect(rendered).to(match(/Location/))
    expect(rendered).to(match(/Description/))
    expect(rendered).to(match(/2/))
  end
end
