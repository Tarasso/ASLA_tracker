# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('officer_pics/show', type: :view) do
  before do
    @officer_pic = assign(:officer_pic, OfficerPic.create!(
                                          name: 'Name',
                                          officer_title: 'Officer Title'
                                        )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Name/))
    expect(rendered).to(match(/Officer Title/))
  end
end
