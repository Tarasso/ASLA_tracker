# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('business_attendances/index', type: :view) do
  before do
    assign(:business_attendances, [
      BusinessAttendance.create!(
        organization_id: 2,
        event_id: 3
      ),
      BusinessAttendance.create!(
        organization_id: 2,
        event_id: 3
      )
    ]
    )
  end

  it 'renders a list of business_attendances' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
