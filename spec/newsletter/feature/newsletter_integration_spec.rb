# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating a Newsletter', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs' do
    visit new_newsletter_path
    fill_in 'Title', with: 'Intro'
    fill_in 'Message', with: 'Howdy we are ASLA'
    select '2022', from: 'newsletter_date_posted_1i'
    select 'June', from: 'newsletter_date_posted_2i'
    select '8', from: 'newsletter_date_posted_3i'

    click_on 'Create Newsletter'
    visit newsletters_path
    expect(page).to(have_content('Intro'))
    expect(page).to(have_content('Howdy we are ASLA'))
    expect(page).to(have_content('2022-06-08'))
  end
end
