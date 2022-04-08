# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('student_members/show', type: :view) do
  before do
    @student_member = assign(:student_member, StudentMember.create!(
                                                uin: 'Uin',
                                                first_name: 'First Name',
                                                last_name: 'Last Name',
                                                class_year: 'Class Year',
                                                member_title: '',
                                                email: 'Email',
                                                phone_number: 'Phone Number',
                                                expected_graduation_date: 'Expected Graduation Date',
                                                social_point_amount: '',
                                                meeting_point_amount: '',
                                                fundraiser_point_amount: '',
                                                informational_point_amount: '',
                                                dues_paid: '',
                                                picture: ''
                                              )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Uin/))
    expect(rendered).to(match(/First Name/))
    expect(rendered).to(match(/Last Name/))
    expect(rendered).to(match(/Class Year/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Email/))
    expect(rendered).to(match(/Phone Number/))
    expect(rendered).to(match(/Expected Graduation Date/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Officer Title/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
  end
end
