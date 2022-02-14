# frozen_string_literal: true


require 'rails_helper'

RSpec.describe('Creating a Newsletter', type: :feature) do
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
  scenario 'valid inputs' do
    visit new_newsletter_path
    fill_in 'Title', with: 'Intro'
    fill_in 'Message', with: 'Howdy we are ASLA'
    select '2022', :from => 'newsletter_date_posted_1i'      
    select 'June', :from => 'newsletter_date_posted_2i'  
    select '8', :from => 'newsletter_date_posted_3i'        

    click_on 'Create Newsletter'
    visit newsletters_path
    expect(page).to have_content('Intro')
    expect(page).to have_content('Howdy we are ASLA')
    expect(page).to have_content('2022-06-08')
  end
end