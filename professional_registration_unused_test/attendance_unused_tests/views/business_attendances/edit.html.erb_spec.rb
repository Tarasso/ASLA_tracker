# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('business_attendances/edit', type: :view) do
  before do
    @business_attendance = assign(:business_attendance, BusinessAttendance.create!(
                                                          organization_id: 1,
                                                          event_id: 1
                                                        )
    )
  end

  it 'renders the edit business_attendance form' do
    render

    assert_select 'form[action=?][method=?]', business_attendance_path(@business_attendance), 'post' do
      assert_select 'input[name=?]', 'business_attendance[organization_id]'

      assert_select 'input[name=?]', 'business_attendance[event_id]'
    end
  end
end
