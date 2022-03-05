require 'rails_helper'

RSpec.describe "carousels/show", type: :view do
  before(:each) do
    @carousel = assign(:carousel, Carousel.create!(
      pic_name: "Pic Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Pic Name/)
  end
end
