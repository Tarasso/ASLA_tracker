# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(CarouselsController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/carousels').to(route_to('carousels#index'))
    end

    it 'routes to #new' do
      expect(get: '/carousels/new').to(route_to('carousels#new'))
    end

    it 'routes to #show' do
      expect(get: '/carousels/1').to(route_to('carousels#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/carousels/1/edit').to(route_to('carousels#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/carousels').to(route_to('carousels#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/carousels/1').to(route_to('carousels#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/carousels/1').to(route_to('carousels#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/carousels/1').to(route_to('carousels#destroy', id: '1'))
    end
  end
end
