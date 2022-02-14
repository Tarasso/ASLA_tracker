# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(StudentMember, type: :model) do
  subject(:student) do
    described_class.new(uin: '328004941', first_name: 'Jiaming', last_name: 'Fu',
                        class_year: '2077', join_date: Date.new(2002, 5, 4), member_title: 1,
                        email: 'happy.boi@gmail.com', phone_number: '13991328204',
                        expected_graduation_date: Date.new(2078, 2, 4), social_point_amount: 3,
                        fundraiser_point_amount: 4, informational_point_amount: 5, meeting_point_amount: 6,
                        officer_title: 'joker', dues_paid: true, picture: 'lol'
    )
  end

  it 'is valid with valid attributes' do
    expect(student).to(be_valid)
  end

  it 'is not valid without a uin' do
    student.uin = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid without a first name' do
    student.first_name = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid without a last name' do
    student.last_name = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid without a class year' do
    student.class_year = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid without a member title' do
    student.member_title = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid without an email' do
    student.email = nil
    expect(student).not_to(be_valid)
  end
end
