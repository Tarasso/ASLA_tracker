require 'rails_helper'

RSpec.describe "officer_pics/new", type: :view do
  before(:each) do
    assign(:officer_pic, OfficerPic.new(
      name: "MyString",
      officer_title: "MyString"
    ))
  end

  it "renders new officer_pic form" do
    render

    assert_select "form[action=?][method=?]", officer_pics_path, "post" do

      assert_select "input[name=?]", "officer_pic[name]"

      assert_select "input[name=?]", "officer_pic[officer_title]"
    end
  end
end
