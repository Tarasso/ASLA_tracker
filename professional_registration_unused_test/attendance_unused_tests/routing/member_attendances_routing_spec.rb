# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MemberAttendancesController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/member_attendances').to(route_to('member_attendances#index'))
    end

    it 'routes to #new' do
      expect(get: '/member_attendances/new').to(route_to('member_attendances#new'))
    end

    it 'routes to #show' do
      expect(get: '/member_attendances/1').to(route_to('member_attendances#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/member_attendances/1/edit').to(route_to('member_attendances#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/member_attendances').to(route_to('member_attendances#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/member_attendances/1').to(route_to('member_attendances#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/member_attendances/1').to(route_to('member_attendances#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/member_attendances/1').to(route_to('member_attendances#destroy', id: '1'))
    end
  end
end
