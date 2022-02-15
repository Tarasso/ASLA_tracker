require 'rails_helper'

RSpec.describe(Event, type: :model) do
  subject do
    described_class.new(date: '2022-11-22', name: 'Football', location: 'Kyle Field', start_time: '13:30', finish_time: '16:30', description: 'Having fun', event_type: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a start time' do
    subject.start_time= nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a finish time' do
    subject.finish_time = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without an event type' do
    subject.event_type = nil
    expect(subject).not_to(be_valid)
  end
end