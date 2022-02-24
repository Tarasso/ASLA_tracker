# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Sending an email', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs' do
    visit 'pages/mail'
    fill_in 'emails', with: 'to@example.org'
    fill_in 'subject', with: 'test subject'
    fill_in 'body', with: 'test body'
    click_on 'Submit'
    expect(page).to(have_content('Sent Email:'))
    expect(page).to(have_content('to@example.org'))
    expect(page).to(have_content('test subject'))
    expect(page).to(have_content('test body'))
  end
end
