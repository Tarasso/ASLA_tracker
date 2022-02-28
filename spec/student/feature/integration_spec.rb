# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating a Student Member', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs create' do
    visit new_student_member_path

    fill_in 'Uin', with: '328004941'
    fill_in 'First name', with: 'Jiaming'
    fill_in 'Last name', with: 'Fu'
    fill_in 'Class year', with: '2023'
    select '2022', from: 'student_member_join_date_1i'
    select 'May', from: 'student_member_join_date_2i'
    select '5', from: 'student_member_join_date_3i'
    select 'Member', from: 'student_member_member_title'
    fill_in 'Email', with: 'piercefi@tamu.edu'
    fill_in 'Phone number', with: '5127309368'
    select '2022', from: 'student_member_expected_graduation_date_1i'
    select 'May', from: 'student_member_expected_graduation_date_2i'
    select '6', from: 'student_member_expected_graduation_date_3i'
    fill_in 'Picture', with: 'Hello'
    click_on 'Create Student member'

    visit student_members_path
    expect(page).to(have_content('328004941'))
    expect(page).to(have_content('Jiaming'))
    expect(page).to(have_content('Fu'))
    expect(page).to(have_content('2023'))
    expect(page).to(have_content('2022-05-05'))
    expect(page).to(have_content('piercefi@tamu.edu'))
    expect(page).to(have_content('5127309368'))
    expect(page).to(have_content('2022-05-06'))
    expect(page).to(have_content('Hello'))
  end

  # similar test, but different choices for drop down menus and testing for the show page
  it 'valid inputs show' do
    visit new_student_member_path

    fill_in 'Uin', with: '1336443725'
    fill_in 'First name', with: 'Pierce'
    fill_in 'Last name', with: 'Ju'
    fill_in 'Class year', with: '2023'
    select '2017', from: 'student_member_join_date_1i'
    select 'May', from: 'student_member_join_date_2i'
    select '5', from: 'student_member_join_date_3i'
    fill_in 'Email', with: 'fu.pierce123@gmail.edu'
    fill_in 'Phone number', with: '13991328204'
    select '2025', from: 'student_member_expected_graduation_date_1i'
    select 'May', from: 'student_member_expected_graduation_date_2i'
    select '6', from: 'student_member_expected_graduation_date_3i'
    fill_in 'Picture', with: 'Handsome photo'
    click_on 'Create Student member'

    expect(page).to(have_content('1336443725'))
    expect(page).to(have_content('Pierce'))
    expect(page).to(have_content('Ju'))
    expect(page).to(have_content('2023'))
    expect(page).to(have_content('2017-05-05'))
    expect(page).to(have_content('fu.pierce123@gmail.edu'))
    expect(page).to(have_content('13991328204'))
    expect(page).to(have_content('2025-05-06'))
    expect(page).to(have_content('Handsome photo'))
  end
end
