require 'rails_helper'

RSpec.describe "event_student_members/index", type: :view do
  before(:each) do
    assign(:event_student_members, [
      EventStudentMember.create!(
        member_id: 2,
        event_id: 3
      ),
      EventStudentMember.create!(
        member_id: 2,
        event_id: 3
      )
    ])
  end

  it "renders a list of event_student_members" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
