# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('member_attendances/show', type: :view) do
  before do
    @member_attendance = assign(:member_attendance, MemberAttendance.create!(
                                                      member_id: 2,
                                                      event_id: 3,
                                                      point_type: 4
                                                    )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/3/))
    expect(rendered).to(match(/4/))
  end
end
