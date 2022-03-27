# frozen_string_literal: true
# # frozen_string_literal: true

# # location: spec/feature/integration_spec.rb
# require 'rails_helper'

# RSpec.describe('Registering business professional for event', type: :feature) do
#   before do
#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#     visit pages_select_account_type_path
#     click_on 'Business Professional'

#     visit new_business_professional_path
#     fill_in 'Org name', with: 'Company 1'
#     fill_in 'First name', with: 'John'
#     fill_in 'Last name', with: 'Doe'
#     fill_in 'Phone num', with: '+19798451234'
#     fill_in 'Email', with: 'email@email.com'
#     click_on 'Create account'

#     visit new_event_path
#     select '2022', from: 'event_date_1i'
#     select 'November', from: 'event_date_2i'
#     select '22', from: 'event_date_3i'
#     fill_in 'Name', with: 'Football'
#     fill_in 'Location', with: 'Kyle Field'
#     select '13', from: 'event_start_time_4i'
#     select '30', from: 'event_start_time_5i'
#     select '16', from: 'event_finish_time_4i'
#     select '30', from: 'event_finish_time_5i'
#     fill_in 'Description', with: 'Having fun'
#     select 'Social', from: 'event_event_type'
#     click_on 'Create Event'
#   end

#   it 'register business professional' do
#     visit new_event_business_professional_path
#     fill_in 'Organization', with: 1
#     fill_in 'Event', with: 1
#     click_on 'Create Event business professional'
#     expect(page).to(have_content('Event business professional was successfully created.'))
#     click_on 'Back'
#     click_on 'Delete'
#     expect(page).to(have_content('Event business professional was successfully destroyed.'))

#     visit events_business_professional_path(BusinessProfessional.last)
#     click_on 'Register'
#     expect(page).to(have_content('You have registered.'))
#     click_on 'Unregister'
#     expect(page).to(have_content('You have unregistered.'))
#   end
# end
