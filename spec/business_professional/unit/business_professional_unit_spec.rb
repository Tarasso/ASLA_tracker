# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BusinessProfessional, type: :model) do
  subject do
    described_class.new(org_name: 'Company 1', first_name: 'John', last_name: 'Doe', phone_num: '+19798451234', email: 'email@email.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a organization name' do
    subject.org_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without an first name' do
    subject.first_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a phone number' do
    subject.phone_num = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to(be_valid)
  end
end
