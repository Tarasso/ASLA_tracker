# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Registering business professional for event', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    visit root_path
    click_on 'Sign in'
    visit pages_select_account_type_path
    click_on 'Business Professional'
    fill_in 'Org name', with: 'Company 1'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone num', with: '+19798451234'
    fill_in 'Email', with: 'email@email.com'
    click_on 'Create account'
    page.set_rack_session(isAdmin: true)
    visit new_event_path
    fill_in 'Name', with: 'Football'
    fill_in 'Location', with: 'Kyle Field'
    fill_in 'Description', with: 'Having fun'
    click_on 'Create Event'
    page.set_rack_session(isAdmin: true)
  end

  it 'register business professional' do
    visit(business_professionals_path)
    visit events_business_professional_path(BusinessProfessional.last)
    click_on 'Register'
    expect(page).to(have_content('You have registered for the event.'))
    click_on 'Unregister'
    expect(page).to(have_content('You have unregistered for the event.'))
    click_on 'Register'
    click_on 'Attended'
  end
end
