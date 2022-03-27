# frozen_string_literal: true

require 'rails_helper'

# integration tests for copying emails to clipboard
RSpec.describe('Copying emails to clipboard', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  # test if officer can copy emails of members
  it 'can copy member emails' do
    create_student_member(page)
    page.set_rack_session(isAdmin: true)
    visit('/pages/user_dashboard')
    page.check('non-officer students')
    click_on('Copy to Clipboard')
    page.html.should include('userdoe@example.com')
  end

  # test if officer can copy emails of business professionals
  it 'can copy business professionals emails' do
    create_business_professional(page)
    page.set_rack_session(isAdmin: true)
    visit('/pages/user_dashboard')
    page.check('business professionals')
    click_on('Copy to Clipboard')
    page.html.should include('userdoe@example.com')
  end

  # test if officer can copy emails of officers
  it 'can copy officers emails' do
    
    # creates officer
    create_student_member(page)
    page.set_rack_session(isAdmin: true)
    visit edit_student_member_path(StudentMember.last.id)
    select('Officer', from: 'student_member_member_title')
    click_on('Update account')

    visit('/pages/user_dashboard')
    page.check('officers')
    click_on('Copy to Clipboard')
    page.html.should include('userdoe@example.com')
  end

  def create_student_member(page)
    visit(new_student_member_path)
    fill_in('Uin', with: '328004941')
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
  end

  def create_business_professional(page)
    visit(new_business_professional_path)
    fill_in('Org name', with: 'Company 1')
    fill_in('First name', with: 'John')
    fill_in('Last name', with: 'Doe')
    fill_in('Phone num', with: '+19798451234')
    fill_in('Email', with: 'bpro@email.com')
    click_on('Create account')
  end
end
