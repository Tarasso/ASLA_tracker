require 'rails_helper'

RSpec.describe "event_student_members/show", type: :view do
  before(:each) do
    @event_student_member = assign(:event_student_member, EventStudentMember.create!(
      member_id: 2,
      event_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
