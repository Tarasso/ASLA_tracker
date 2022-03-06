# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(EventBusinessProfessionalsController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/event_business_professionals').to(route_to('event_business_professionals#index'))
    end

    it 'routes to #new' do
      expect(get: '/event_business_professionals/new').to(route_to('event_business_professionals#new'))
    end

    it 'routes to #show' do
      expect(get: '/event_business_professionals/1').to(route_to('event_business_professionals#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/event_business_professionals/1/edit').to(route_to('event_business_professionals#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/event_business_professionals').to(route_to('event_business_professionals#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/event_business_professionals/1').to(route_to('event_business_professionals#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/event_business_professionals/1').to(route_to('event_business_professionals#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/event_business_professionals/1').to(route_to('event_business_professionals#destroy', id: '1'))
    end
  end
end
