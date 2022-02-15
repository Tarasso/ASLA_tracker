# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating a Student Member', type: :feature) do
  # before(:each) do
  #  OmniAuth.config.add_mock(:google, {:uid => '12345'})
  #  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  #  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  # end

  # before do
  #  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  #  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
  # Permission.create!(description: 'admin') if Permission.where(description: 'admin').first.nil?
  # unless Admin.where(email: 'admindoe@example.com').first.nil? == false
  #  Admin.create!(email: 'admindoe@example.com', full_name: 'Admin Doe', uid: '234567890', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
  # end
  # unless Admin.where(email: 'userdoe@example.com').first.nil? == false
  #  Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
  # end
  # end

  it 'valid access' do
    visit calendars_path
    expect(page).to(have_content('Google Calendar'))
  end
end
