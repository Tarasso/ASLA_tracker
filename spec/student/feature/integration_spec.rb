# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating a Student Member', type: :feature) do
  # before(:each) do
  #  OmniAuth.config.add_mock(:google, {:uid => '12345'})
  #  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  #  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  # end

  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    # Permission.create!(description: 'admin') if Permission.where(description: 'admin').first.nil?
    # unless Admin.where(email: 'admindoe@example.com').first.nil? == false
    #  Admin.create!(email: 'admindoe@example.com', full_name: 'Admin Doe', uid: '234567890', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
    # end
    # unless Admin.where(email: 'userdoe@example.com').first.nil? == false
    #  Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
    # end
  end

  it 'valid inputs' do
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
    fill_in 'Social point amount', with: 12
    fill_in 'Meeting point amount', with: 13
    fill_in 'Fundraiser point amount', with: 14
    fill_in 'Informational point amount', with: 15
    fill_in 'Officer title', with: 'Big boi'
    select 'No', from: 'student_member_dues_paid'
    fill_in 'Picture', with: 'Hello'
    click_on 'Create Student member'

    visit student_members_path
    expect(page).to(have_content('328004941'))
    expect(page).to(have_content('Jiaming'))
    expect(page).to(have_content('Fu'))
    expect(page).to(have_content('2023'))
    expect(page).to(have_content('2022-05-05'))
    expect(page).to(have_content('member'))
    expect(page).to(have_content('piercefi@tamu.edu'))
    expect(page).to(have_content('5127309368'))
    expect(page).to(have_content('2022-05-06'))
    expect(page).to(have_content('12'))
    expect(page).to(have_content('13'))
    expect(page).to(have_content('14'))
    expect(page).to(have_content('15'))
    expect(page).to(have_content('Big boi'))
    expect(page).to(have_content('false'))
    expect(page).to(have_content('Hello'))
  end
end
