# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(EventBusinessProfessional, type: :model) do
  subject(:event_business_professional) do
    described_class.new(organization_id: 1, event_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(event_business_professional).to(be_valid)
  end

  it 'is not valid without a organization id' do
    event_business_professional.organization_id = nil
    expect(event_business_professional).not_to(be_valid)
  end

  it 'is not valid without an event id' do
    event_business_professional.event_id = nil
    expect(event_business_professional).not_to(be_valid)
  end
end