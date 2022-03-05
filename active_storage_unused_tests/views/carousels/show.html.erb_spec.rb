# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('carousels/show', type: :view) do
  before do
    @carousel = assign(:carousel, Carousel.create!(
                                    pic_name: 'Pic Name'
                                  )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Pic Name/))
  end
end
