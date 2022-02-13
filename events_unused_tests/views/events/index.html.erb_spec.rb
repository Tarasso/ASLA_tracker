# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/index', type: :view) do
  before do
    assign(:events, [
      Event.create!(
        name: 'Name',
        location: 'Location',
        description: 'Description',
        event_type: 2
      ),
      Event.create!(
        name: 'Name',
        location: 'Location',
        description: 'Description',
        event_type: 2
      )
    ]
    )
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Location'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
