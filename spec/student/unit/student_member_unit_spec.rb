# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(StudentMember, type: :model) do
  subject(:student) do
    described_class.new(uin: '328004941', first_name: 'Jiaming', last_name: 'Fu',
                        class_year: '2077', join_date: Date.new(2002, 5, 4), member_title: 1,
                        email: 'happy.boi@gmail.com', phone_number: '+19365551234',
                        expected_graduation_date: Date.new(2078, 2, 4), social_point_amount: 3,
                        fundraiser_point_amount: 4, informational_point_amount: 5, meeting_point_amount: 6,
                        officer_title: 'joker', dues_paid: true, student_classification: 1, program_level: 1
    )
  end

  it 'is valid with valid attributes' do
    expect(student).to(be_valid)
  end

  it 'is not valid without a uin' do
    student.uin = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid with a uin that is too long' do
    student.uin = '9280031820'
    expect(student).not_to(be_valid)
  end

  it 'is not valid with a uin that is too short' do
    student.uin = '92800318'
    expect(student).not_to(be_valid)
  end

  it 'is not valid with a uin that contains letters' do
    student.uin = '92800318K'
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

  it 'is valid with a two last names' do
    student.last_name = 'Jones Smith'
    expect(student).to(be_valid)
  end

  it 'is valid with a junior title' do
    student.last_name = 'Jones Jr.'
    expect(student).to(be_valid)
  end

  it 'is valid with a hypenated last name' do
    student.last_name = 'Jones-Smith'
    expect(student).to(be_valid)
  end

  it 'is valid with a \' in the last name' do
    student.last_name = 'O\'Connor'
    expect(student).to(be_valid)
  end

  it 'is not valid without a class year' do
    student.class_year = nil
    expect(student).not_to(be_valid)
  end

  it 'is not valid with a 2 digit class year' do
    student.class_year = '23'
    expect(student).not_to(be_valid)
  end

  it 'is not valid without an email' do
    student.email = nil
    expect(student).not_to(be_valid)
  end
end
