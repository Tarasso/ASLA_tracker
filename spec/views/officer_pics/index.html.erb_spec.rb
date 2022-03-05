require 'rails_helper'

RSpec.describe "officer_pics/index", type: :view do
  before(:each) do
    assign(:officer_pics, [
      OfficerPic.create!(
        name: "Name",
        officer_title: "Officer Title"
      ),
      OfficerPic.create!(
        name: "Name",
        officer_title: "Officer Title"
      )
    ])
  end

  it "renders a list of officer_pics" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Officer Title".to_s, count: 2
  end
end
