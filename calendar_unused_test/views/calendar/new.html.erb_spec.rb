# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('calendars/new', type: :view) do
  before do
    assign(:calendar, Calendar.new)
  end

  it 'renders new calendar form' do
    render

    assert_select 'form[action=?][method=?]', calendars_path, 'post' do
    end
  end
end
