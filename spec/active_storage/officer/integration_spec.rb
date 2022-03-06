# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating an Officer Pic', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs create' do
    visit new_officer_pic_path

    fill_in 'Name', with: 'Josh'
    fill_in 'Officer title', with: 'President'
    attach_file('officer_pic_image', 'spec/active_storage/officer/pic.jpg')
    click_on 'Create Officer pic'

    # show page
    expect(page).to(have_content('Josh'))
    expect(page).to(have_content('President'))

    # index page
    visit officer_pics_path
    expect(page).to(have_content('Josh'))
    expect(page).to(have_content('President'))
  end
end
