# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('member_attendances/edit', type: :view) do
  before do
    @member_attendance = assign(:member_attendance, MemberAttendance.create!(
                                                      member_id: 1,
                                                      event_id: 1,
                                                      point_type: 1
                                                    )
    )
  end

  it 'renders the edit member_attendance form' do
    render

    assert_select 'form[action=?][method=?]', member_attendance_path(@member_attendance), 'post' do
      assert_select 'input[name=?]', 'member_attendance[member_id]'

      assert_select 'input[name=?]', 'member_attendance[event_id]'

      assert_select 'input[name=?]', 'member_attendance[point_type]'
    end
  end
end
