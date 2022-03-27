# frozen_string_literal: true
# # frozen_string_literal: true

# # location: spec/feature/integration_spec.rb
# require 'rails_helper'

# RSpec.describe('Creating a Student Member', type: :feature) do
#   before do
#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
#     visit root_path
#     click_on 'Sign in'
#   end

#   it 'users can see member tools nav bar' do
#     create_student_member(page)
#     visit root_path
#     expect(page).to(have_content('Member Tools'))
#   end

#   it 'officers can see show, edit, and destroy on members page' do
#     create_student_member(page)
#     page.set_rack_session(isAdmin: true)
#     visit student_members_path

#     expect(page).to(have_content('Show'))
#     expect(page).to(have_content('Edit'))
#     expect(page).to(have_content('Delete'))
#   end

#   it 'officer can show someone else\'s information' do
#     create_student_member(page)
#     click_on 'Sign Out'

#     other_account_id = StudentMember.last.id

#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#     create_student_member(page)

#     page.set_rack_session(isAdmin: true)

#     visit student_member_path(other_account_id)

#     expect(page).to(have_content('admindoe@example.com'))
#   end

#   it 'officer can edit someone else\'s information' do
#     create_student_member(page)
#     click_on 'Sign Out'

#     other_account_id = StudentMember.last.id

#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#     create_student_member(page)

#     page.set_rack_session(isAdmin: true)

#     visit edit_student_member_path(other_account_id)

#     fill_in 'Uin', with: '123456789'
#     click_on 'Update account'

#     expect(page).to(have_content('123456789'))
#   end

#   it 'user can search for member' do
#     create_student_member(page)
#     click_on 'Sign Out'

#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#     create_student_member(page)

#     visit student_members_path

#     fill_in 'q', with: 'Mrosko'
#     click_on 'Search'

#     expect(page).not_to(have_content('Jiaming'))
#   end

#   it 'members cannot see show, edit, and destroy on members page' do
#     create_student_member(page)
#     visit student_members_path

#     expect(page).not_to(have_content('Show'))
#     expect(page).not_to(have_content('Edit'))
#     expect(page).not_to(have_content('Delete'))
#   end

#   it 'user cannot show someone else\'s information' do
#     create_student_member(page)
#     click_on 'Sign Out'

#     other_account_id = StudentMember.last.id

#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#     create_student_member(page)

#     visit student_member_path(other_account_id)

#     expect(page).to(have_content('You do not have the permission to access this page'))
#   end

#   it 'user cannot edit someone else\'s information' do
#     create_student_member(page)
#     click_on 'Sign Out'

#     other_account_id = StudentMember.last.id

#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#     create_student_member(page)

#     visit edit_student_member_path(other_account_id)

#     expect(page).to(have_content('You do not have the permission to access this page'))
#   end

#   it 'user can edit their own information' do
#     create_student_member(page)

#     visit edit_student_member_path(StudentMember.last.id)
#     fill_in 'Uin', with: '123456789'
#     click_on 'Update account'

#     expect(page).to(have_content('123456789'))
#   end

#   it 'user can view their own information' do
#     create_student_member(page)

#     visit student_member_path(StudentMember.last.id)

#     expect(page).to(have_content('admindoe@example.com'))
#   end

#   it 'valid inputs create' do
#     create_student_member(page)

#     visit student_members_path
#     expect(page).to(have_content('Jiaming'))
#     expect(page).to(have_content('Fu'))
#     expect(page).to(have_content('2023'))
#     expect(page).to(have_content('admindoe@example.com'))
#   end

#   # similar test, but different choices for drop down menus and testing for the show page
#   it 'valid inputs show' do
#     create_student_member(page)

#     expect(page).to(have_content('328004941'))
#     expect(page).to(have_content('Jiaming'))
#     expect(page).to(have_content('Fu'))
#     expect(page).to(have_content('2023'))
#     expect(page).to(have_content('2022-05-05'))
#     expect(page).to(have_content('(512) 730-9368'))
#     expect(page).to(have_content('2022-05-01'))
#     expect(page).to(have_content('admindoe@example.com'))
#   end

#   def create_student_member(page)
#     visit(new_student_member_path)
#     fill_in('Uin', with: '328004941')
#     fill_in('First name', with: 'Jiaming')
#     fill_in('Last name', with: 'Fu')
#     fill_in('Class year', with: '2023')
#     select('2022', from: 'student_member_join_date_1i')
#     select('May', from: 'student_member_join_date_2i')
#     select('5', from: 'student_member_join_date_3i')
#     fill_in('Phone number', with: '5127309368')
#     select('2022', from: 'student_member_expected_graduation_date_1i')
#     select('May', from: 'student_member_expected_graduation_date_2i')
#     click_on('Create account')
#   end
# end
