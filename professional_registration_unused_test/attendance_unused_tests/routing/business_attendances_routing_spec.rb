# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BusinessAttendancesController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/business_attendances').to(route_to('business_attendances#index'))
    end

    it 'routes to #new' do
      expect(get: '/business_attendances/new').to(route_to('business_attendances#new'))
    end

    it 'routes to #show' do
      expect(get: '/business_attendances/1').to(route_to('business_attendances#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/business_attendances/1/edit').to(route_to('business_attendances#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/business_attendances').to(route_to('business_attendances#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/business_attendances/1').to(route_to('business_attendances#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/business_attendances/1').to(route_to('business_attendances#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/business_attendances/1').to(route_to('business_attendances#destroy', id: '1'))
    end
  end
end
