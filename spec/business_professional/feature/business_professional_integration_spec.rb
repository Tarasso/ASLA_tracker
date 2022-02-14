# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating a Business professional', type: :feature) do
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
    visit new_business_professional_path

    fill_in 'Org name', with: 'Company 1'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone num', with: '999-999-9999'
    fill_in 'Email', with: 'email@email.com'
    click_on 'Create Business professional'
    visit business_professionals_path
    expect(page).to(have_content('Company 1'))
    expect(page).to(have_content('John'))
    expect(page).to(have_content('Doe'))
    expect(page).to(have_content('999-999-9999'))
    expect(page).to(have_content('email@email.com'))
  end
end
