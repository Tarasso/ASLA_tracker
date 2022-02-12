# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('student_members/new', type: :view) do
  before do
    assign(:student_member, StudentMember.new(
                              uin: 'MyString',
                              first_name: 'MyString',
                              last_name: 'MyString',
                              class_year: 'MyString',
                              member_title: '',
                              email: 'MyString',
                              phone_number: 'MyString',
                              expected_graduation_date: 'MyString',
                              social_point_amount: '',
                              meeting_point_amount: '',
                              fundraiser_point_amount: '',
                              informational_point_amount: '',
                              officer_title: 'MyString',
                              dues_paid: '',
                              picture: ''
                            )
    )
  end

  it 'renders new student_member form' do
    render

    assert_select 'form[action=?][method=?]', student_members_path, 'post' do
      assert_select 'input[name=?]', 'student_member[uin]'

      assert_select 'input[name=?]', 'student_member[first_name]'

      assert_select 'input[name=?]', 'student_member[last_name]'

      assert_select 'input[name=?]', 'student_member[class_year]'

      assert_select 'input[name=?]', 'student_member[member_title]'

      assert_select 'input[name=?]', 'student_member[email]'

      assert_select 'input[name=?]', 'student_member[phone_number]'

      assert_select 'input[name=?]', 'student_member[expected_graduation_date]'

      assert_select 'input[name=?]', 'student_member[social_point_amount]'

      assert_select 'input[name=?]', 'student_member[meeting_point_amount]'

      assert_select 'input[name=?]', 'student_member[fundraiser_point_amount]'

      assert_select 'input[name=?]', 'student_member[informational_point_amount]'

      assert_select 'input[name=?]', 'student_member[officer_title]'

      assert_select 'input[name=?]', 'student_member[dues_paid]'

      assert_select 'input[name=?]', 'student_member[picture]'
    end
  end
end
