# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating an Event', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs' do
    visit new_event_path

    select '2022', from: 'event_date_1i'
    select 'November', from: 'event_date_2i'
    select '22', from: 'event_date_3i'
    fill_in 'Name', with: 'Football'
    fill_in 'Location', with: 'Kyle Field'
    select '13', from: 'event_start_time_4i'
    select '30', from: 'event_start_time_5i'
    select '16', from: 'event_finish_time_4i'
    select '30', from: 'event_finish_time_5i'
    fill_in 'Description', with: 'Having fun'
    select 'Social', from: 'event_event_type'
    click_on 'Create Event'

    visit events_path
    print page.html
    expect(page).to(have_content('2022'))
    expect(page).to(have_content('November'))
    expect(page).to(have_content('22'))
    expect(page).to(have_content('2022'))
    expect(page).to(have_content('Football'))
    expect(page).to(have_content('Kyle Field'))
    expect(page).to(have_content('12'))
    expect(page).to(have_content('30'))
    expect(page).to(have_content('15'))
    expect(page).to(have_content('30'))
    expect(page).to(have_content('Having fun'))
    expect(page).to(have_content('social'))
  end
end
