# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(OfficerPic, type: :model) do
  subject(:officer) do
    described_class.new(name: 'Josh', officer_title: 'President'
    )
  end

  it 'is not valid without a picture' do
    officer.image = nil
    expect(officer).not_to(be_valid)
  end

  it 'is not valid without a title' do
    officer.officer_title = nil
    expect(officer).not_to(be_valid)
  end

  it 'is not valid without a name' do
    officer.name = nil
    expect(officer).not_to(be_valid)
  end
end
