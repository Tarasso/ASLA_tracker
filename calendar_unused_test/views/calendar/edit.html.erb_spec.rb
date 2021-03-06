# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('calendars/edit', type: :view) do
  before do
    @calendar = assign(:calendar, Calendar.create!)
  end

  it 'renders the edit calendar form' do
    render

    assert_select 'form[action=?][method=?]', calendar_path(@calendar), 'post' do
    end
  end
end
