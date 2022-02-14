# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('calendars/index', type: :view) do
  before do
    assign(:calendars, [
      Calendar.create!,
      Calendar.create!
    ]
    )
  end

  it 'renders a list of calendars' do
    render
  end
end
