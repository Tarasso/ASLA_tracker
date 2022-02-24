# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Event, type: :model) do
  subject(:event) do
    described_class.new(date: '2022-11-22', name: 'Football', location: 'Kyle Field', start_time: '13:30', finish_time: '16:30', description: 'Having fun', event_type: 1)
  end

  it 'is valid with valid attributes' do
    expect(event).to(be_valid)
  end

  it 'is not valid without a date' do
    event.date = nil
    expect(event).not_to(be_valid)
  end

  it 'is not valid without a name' do
    event.name = nil
    expect(event).not_to(be_valid)
  end

  it 'is not valid without a location' do
    event.location = nil
    expect(event).not_to(be_valid)
  end

  it 'is not valid without a start time' do
    event.start_time = nil
    expect(event).not_to(be_valid)
  end

  it 'is not valid without a finish time' do
    event.finish_time = nil
    expect(event).not_to(be_valid)
  end

  it 'is not valid without a description' do
    event.description = nil
    expect(event).not_to(be_valid)
  end

  it 'is not valid without an event type' do
    event.event_type = nil
    expect(event).not_to(be_valid)
  end
end
