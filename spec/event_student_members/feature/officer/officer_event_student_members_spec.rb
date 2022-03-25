# frozen_string_literal: true
# # frozen_string_literal: true

# # location: spec/feature/integration_spec.rb
# require 'rails_helper'

# RSpec.describe('Creating a Student Member', type: :feature) do
#   before do
#     Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
#     Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
#     visit root_path
#     click_on 'Sign in'
#   end

#   it 'valid inputs create' do
#     visit new_student_member_path

#     fill_in 'Uin', with: '328004941'
#     fill_in 'First name', with: 'Jiaming'
#     fill_in 'Last name', with: 'Fu'
#     fill_in 'Class year', with: '2023'
#     select '2022', from: 'student_member_join_date_1i'
#     select 'May', from: 'student_member_join_date_2i'
#     select '5', from: 'student_member_join_date_3i'
#     fill_in 'Phone number', with: '5127309368'
#     select '2022', from: 'student_member_expected_graduation_date_1i'
#     select 'May', from: 'student_member_expected_graduation_date_2i'
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
#     visit events_student_member_path(StudentMember.last)
#     print page.html
#     click_on 'Register'
#     visit event_student_members_path
#     print page.html
#     expect(page).to(have_content('Jiaming'))
#     expect(page).to(have_content('Football'))
#   end
# end
