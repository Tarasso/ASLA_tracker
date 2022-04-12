# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating an Carousel Pic', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs create' do
    page.set_rack_session(isAdmin: true)
    visit new_carousel_path

    fill_in 'Pic name', with: 'Fil pic 1'
    attach_file('carousel_image', 'spec/active_storage/carousel/bg.jpg')
    click_on 'Create Carousel'

    # show page
    expect(page).to(have_content('Fil pic 1'))

    # index page
    visit carousels_path
    expect(page).to(have_content('Fil pic 1'))
  end
end
