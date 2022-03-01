# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Loggin into an existing account', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
  end

  it 'signs in' do
    visit root_path
    click_on 'Sign in'

    expect(page).to(have_content('Successfully authenticated from Google account.'))
  end
end
