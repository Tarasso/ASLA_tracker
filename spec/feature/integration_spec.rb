# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a Business professional', type: :feature do
  scenario 'valid inputs' do
    visit new_business_professional_path
    
    fill_in "Org name", with: 'Company 1'
    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Doe'
    fill_in "Phone num", with: '999-999-9999'
    fill_in "Email", with: 'email@email.com'
    click_on 'Create Business professional'
    visit business_professionals_path
    expect(page).to have_content('Company 1')
    expect(page).to have_content('John')
    expect(page).to have_content('Doe')
    expect(page).to have_content('999-999-9999')
    expect(page).to have_content('email@email.com')
  end
end