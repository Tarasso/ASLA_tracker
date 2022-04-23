# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Reseting dues and points', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
    visit root_path
    click_on 'Sign in'
  end

  it 'resets dues and points' do
    visit(new_student_member_path)
    fill_in('UIN', with: '328004941')
    fill_in('First name', with: 'Jiaming')
    fill_in('Last name', with: 'Fu')
    fill_in('Class year', with: '2023')
    select('2022', from: 'student_member_join_date_1i')
    select('May', from: 'student_member_join_date_2i')
    select('5', from: 'student_member_join_date_3i')
    fill_in('Phone number', with: '5127309368')
    select('2022', from: 'student_member_expected_graduation_date_1i')
    select('May', from: 'student_member_expected_graduation_date_2i')
    click_on('Create account')
    page.set_rack_session(isAdmin: true)
    visit(student_members_path)
    # fill_in('required_points', with: 237)
    # click_on('Update')
  end
end
