require 'rails_helper'

RSpec.describe "carousels/index", type: :view do
  before(:each) do
    assign(:carousels, [
      Carousel.create!(
        pic_name: "Pic Name"
      ),
      Carousel.create!(
        pic_name: "Pic Name"
      )
    ])
  end

  it "renders a list of carousels" do
    render
    assert_select "tr>td", text: "Pic Name".to_s, count: 2
  end
end
