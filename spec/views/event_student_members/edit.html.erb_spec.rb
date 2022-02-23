require 'rails_helper'

RSpec.describe "event_student_members/edit", type: :view do
  before(:each) do
    @event_student_member = assign(:event_student_member, EventStudentMember.create!(
      member_id: 1,
      event_id: 1
    ))
  end

  it "renders the edit event_student_member form" do
    render

    assert_select "form[action=?][method=?]", event_student_member_path(@event_student_member), "post" do

      assert_select "input[name=?]", "event_student_member[member_id]"

      assert_select "input[name=?]", "event_student_member[event_id]"
    end
  end
end
