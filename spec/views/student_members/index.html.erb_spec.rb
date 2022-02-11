require 'rails_helper'

RSpec.describe "student_members/index", type: :view do
  before(:each) do
    assign(:student_members, [
      StudentMember.create!(
        uin: "Uin",
        first_name: "First Name",
        last_name: "Last Name",
        class_year: "Class Year",
        member_title: "",
        email: "Email",
        phone_number: "Phone Number",
        expected_graduation_date: "Expected Graduation Date",
        social_point_amount: "",
        meeting_point_amount: "",
        fundraiser_point_amount: "",
        informational_point_amount: "",
        officer_title: "Officer Title",
        dues_paid: "",
        picture: ""
      ),
      StudentMember.create!(
        uin: "Uin",
        first_name: "First Name",
        last_name: "Last Name",
        class_year: "Class Year",
        member_title: "",
        email: "Email",
        phone_number: "Phone Number",
        expected_graduation_date: "Expected Graduation Date",
        social_point_amount: "",
        meeting_point_amount: "",
        fundraiser_point_amount: "",
        informational_point_amount: "",
        officer_title: "Officer Title",
        dues_paid: "",
        picture: ""
      )
    ])
  end

  it "renders a list of student_members" do
    render
    assert_select "tr>td", text: "Uin".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Class Year".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Expected Graduation Date".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Officer Title".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
