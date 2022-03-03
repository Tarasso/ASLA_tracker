# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating a Business professional', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs' do
    visit new_business_professional_path

    fill_in 'Org name', with: 'Company 1'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone num', with: '+19798451234'
    fill_in 'Email', with: 'email@email.com'
    click_on 'Create Business professional'

    visit business_professionals_path
    expect(page).to(have_content('Company 1'))
    expect(page).to(have_content('John'))
    expect(page).to(have_content('Doe'))
    expect(page).to(have_content('(979) 845-1234'))
    expect(page).to(have_content('userdoe@example.com'))
  end
end
