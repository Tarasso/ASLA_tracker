# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('officer_pics/edit', type: :view) do
  before do
    @officer_pic = assign(:officer_pic, OfficerPic.create!(
                                          name: 'MyString',
                                          officer_title: 'MyString'
                                        )
    )
  end

  it 'renders the edit officer_pic form' do
    render

    assert_select 'form[action=?][method=?]', officer_pic_path(@officer_pic), 'post' do
      assert_select 'input[name=?]', 'officer_pic[name]'

      assert_select 'input[name=?]', 'officer_pic[officer_title]'
    end
  end
end
