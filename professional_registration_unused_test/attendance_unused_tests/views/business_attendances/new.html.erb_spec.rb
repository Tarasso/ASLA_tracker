# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('business_attendances/new', type: :view) do
  before do
    assign(:business_attendance, BusinessAttendance.new(
                                   organization_id: 1,
                                   event_id: 1
                                 )
    )
  end

  it 'renders new business_attendance form' do
    render

    assert_select 'form[action=?][method=?]', business_attendances_path, 'post' do
      assert_select 'input[name=?]', 'business_attendance[organization_id]'

      assert_select 'input[name=?]', 'business_attendance[event_id]'
    end
  end
end
