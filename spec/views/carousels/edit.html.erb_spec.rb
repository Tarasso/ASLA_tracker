require 'rails_helper'

RSpec.describe "carousels/edit", type: :view do
  before(:each) do
    @carousel = assign(:carousel, Carousel.create!(
      pic_name: "MyString"
    ))
  end

  it "renders the edit carousel form" do
    render

    assert_select "form[action=?][method=?]", carousel_path(@carousel), "post" do

      assert_select "input[name=?]", "carousel[pic_name]"
    end
  end
end
