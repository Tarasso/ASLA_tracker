# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a Student Member', type: :feature do
  scenario 'valid inputs' do
    visit new_student_member_path
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end

