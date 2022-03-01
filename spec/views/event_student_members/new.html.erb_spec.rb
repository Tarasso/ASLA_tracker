require 'rails_helper'

RSpec.describe "event_student_members/new", type: :view do
  before(:each) do
    assign(:event_student_member, EventStudentMember.new(
      member_id: 1,
      event_id: 1
    ))
  end

  it "renders new event_student_member form" do
    render

    assert_select "form[action=?][method=?]", event_student_members_path, "post" do

      assert_select "input[name=?]", "event_student_member[member_id]"

      assert_select "input[name=?]", "event_student_member[event_id]"
    end
  end
end
