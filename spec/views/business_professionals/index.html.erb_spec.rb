require 'rails_helper'

RSpec.describe "business_professionals/index", type: :view do
  before(:each) do
    assign(:business_professionals, [
      BusinessProfessional.create!(
        org_name: "Org Name",
        first_name: "First Name",
        last_name: "Last Name",
        phone_num: "Phone Num",
        email: "Email"
      ),
      BusinessProfessional.create!(
        org_name: "Org Name",
        first_name: "First Name",
        last_name: "Last Name",
        phone_num: "Phone Num",
        email: "Email"
      )
    ])
  end

  it "renders a list of business_professionals" do
    render
    assert_select "tr>td", text: "Org Name".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Phone Num".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
