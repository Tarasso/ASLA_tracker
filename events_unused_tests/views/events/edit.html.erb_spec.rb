# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/edit', type: :view) do
  before do
    @event = assign(:event, Event.create!(
                              name: 'MyString',
                              location: 'MyString',
                              description: 'MyString',
                              event_type: 1
                            )
    )
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(@event), 'post' do
      assert_select 'input[name=?]', 'event[name]'

      assert_select 'input[name=?]', 'event[location]'

      assert_select 'input[name=?]', 'event[description]'

      assert_select 'input[name=?]', 'event[event_type]'
    end
  end
end
