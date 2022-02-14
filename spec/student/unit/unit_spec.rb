# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe StudentMember, type: :model do
  subject do
    described_class.new(uin: '328004941', first_name: 'Jiaming', last_name: 'Fu',
     class_year: '2077', join_date: Date.new(2002, 05, 04), member_title: 1,
      email: 'happy.boi@gmail.com', phone_number: '13991328204',
       expected_graduation_date: Date.new(2078, 02, 04), social_point_amount: 3,
        fundraiser_point_amount: 4, informational_point_amount: 5, meeting_point_amount: 6,
         officer_title: "joker", dues_paid: true, picture: "lol")
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a uin' do
    subject.uin = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a first name' do
    subject.first_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a class year' do
    subject.class_year = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a member title' do
    subject.member_title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

end