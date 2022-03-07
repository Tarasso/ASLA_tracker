# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(Carousel, type: :model) do
  subject(:carousel) do
    described_class.new(pic_name: 'Pic'
                       )
  end

  it 'is not valid without a picture' do
    carousel.image = nil
    expect(carousel).not_to(be_valid)
  end

  it 'is not valid without a pic name' do
    carousel.pic_name = nil
    expect(carousel).not_to(be_valid)
  end
end
