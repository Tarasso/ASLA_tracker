# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating an Event', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
    visit root_path
    click_on 'Sign in'
  end

  it 'valid inputs' do
    visit(new_student_member_path)
    fill_in('Uin', with: '328004941')
    fill_in('First name', with: 'Jiaming')
    fill_in('Last name', with: 'Fu')
    fill_in('Class year', with: '2023')
    select('2022', from: 'student_member_join_date_1i')
    select('May', from: 'student_member_join_date_2i')
    select('5', from: 'student_member_join_date_3i')
    fill_in('Phone number', with: '5127309368')
    select('2022', from: 'student_member_expected_graduation_date_1i')
    select('May', from: 'student_member_expected_graduation_date_2i')
    click_on('Create account')
    page.set_rack_session(isAdmin: true)
    visit(new_event_path)
    select('2022', from: 'event_date_1i')
    select('November', from: 'event_date_2i')
    select('22', from: 'event_date_3i')
    fill_in('Name', with: 'Football')
    fill_in('Location', with: 'Kyle Field')
    select('01 PM', from: 'event_start_time_4i')
    select('00', from: 'event_start_time_5i')
    select('02 PM', from: 'event_finish_time_4i')
    select('00', from: 'event_finish_time_5i')
    fill_in('Description', with: 'Having fun')
    select('Social', from: 'event_event_type')
    click_on('Create Event')

    page.set_rack_session(isAdmin: true)
    visit(events_path)
    visit(edit_event_path(Event.last))
    fill_in('Name', with: 'Texas A&M vs. Alabama')
    click_on('Update Event')
    # expect(page).to(have_content('2022'))
    # expect(page).to(have_content('November'))
    # expect(page).to(have_content('22'))
    # expect(page).to(have_content('2022'))
    # expect(page).to(have_content('Football'))
    # expect(page).to(have_content('Kyle Field'))
    # expect(page).to(have_content('12'))
    # expect(page).to(have_content('30'))
    # expect(page).to(have_content('15'))
    # expect(page).to(have_content('30'))
    # expect(page).to(have_content('Having fun'))
    # expect(page).to(have_content('social')
  end
end
