# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('member_attendances/index', type: :view) do
  before do
    assign(:member_attendances, [
      MemberAttendance.create!(
        member_id: 2,
        event_id: 3,
        point_type: 4
      ),
      MemberAttendance.create!(
        member_id: 2,
        event_id: 3,
        point_type: 4
      )
    ]
    )
  end

  it 'renders a list of member_attendances' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
  end
end
