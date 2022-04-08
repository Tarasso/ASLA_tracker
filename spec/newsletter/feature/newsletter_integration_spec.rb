# frozen_string_literal: true

require 'rails_helper'

# integration tests for creating or editing a newsletter
RSpec.describe('Creating/Editing a Newsletter', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  # tests if valid inputs can create newsletter
  it 'valid inputs create' do
    page.set_rack_session(isAdmin: true)

    visit new_newsletter_path

    fill_in 'Title', with: 'Intro'
    fill_in 'Message', with: 'Howdy we are ASLA'
    attach_file('newsletter_images', 'spec/newsletter/feature/bg.jpg')

    click_on 'Create Newsletter'
    visit newsletters_path
    expect(page).to(have_content('Intro'))
    expect(page).to(have_content('Howdy we are ASLA'))
  end

  # tests if invalid inputs do not create newsletter
  it 'invalid inputs create' do
    page.set_rack_session(isAdmin: true)

    visit new_newsletter_path

    click_on 'Create Newsletter'
    expect(page).to(have_content('2 errors prohibited this newsletter from being saved:'))
  end

  # tests if valid inputs can edit newsletter
  it 'valid inputs edit' do
    page.set_rack_session(isAdmin: true)

    visit new_newsletter_path

    fill_in 'Title', with: 'Intro'
    fill_in 'Message', with: 'Howdy we are ASLA'

    click_on 'Create Newsletter'
    visit edit_newsletter_path(Newsletter.last.id)

    fill_in 'Title', with: 'Introduction'
    fill_in 'Message', with: 'Howdy we are ASLA organization'
    click_on 'Update Newsletter'
    visit newsletters_path

    expect(page).to(have_content('Introduction'))
    expect(page).to(have_content('Howdy we are ASLA organization'))
  end

  # tests if non-officers can create newsletters (should not be able to)
  it 'non-officers create' do
    visit new_newsletter_path

    expect(page).to(have_content('You do not have the permission to access this page'))
  end

  # tests if non-officers can edit newsletters (should not be able to)
  it 'non-officers edit' do
    page.set_rack_session(isAdmin: true)

    visit new_newsletter_path

    fill_in 'Title', with: 'Intro'
    fill_in 'Message', with: 'Howdy we are ASLA'

    click_on 'Create Newsletter'

    page.set_rack_session(isAdmin: false)
    visit edit_newsletter_path(Newsletter.last.id)
    expect(page).to(have_content('You do not have the permission to access this page'))
  end
end
