# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('carousels/new', type: :view) do
  before do
    assign(:carousel, Carousel.new(
                        pic_name: 'MyString'
                      )
    )
  end

  it 'renders new carousel form' do
    render

    assert_select 'form[action=?][method=?]', carousels_path, 'post' do
      assert_select 'input[name=?]', 'carousel[pic_name]'
    end
  end
end
