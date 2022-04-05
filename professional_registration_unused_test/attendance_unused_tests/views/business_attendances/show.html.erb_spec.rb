# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('business_attendances/show', type: :view) do
  before do
    @business_attendance = assign(:business_attendance, BusinessAttendance.create!(
                                                          organization_id: 2,
                                                          event_id: 3
                                                        )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/3/))
  end
end
