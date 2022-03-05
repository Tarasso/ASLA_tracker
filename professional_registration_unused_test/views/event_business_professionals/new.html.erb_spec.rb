# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('event_business_professionals/new', type: :view) do
  before do
    assign(:event_business_professional, EventBusinessProfessional.new(
                                           organization_id: 1,
                                           event_id: 1
                                         )
    )
  end

  it 'renders new event_business_professional form' do
    render

    assert_select 'form[action=?][method=?]', event_business_professionals_path, 'post' do
      assert_select 'input[name=?]', 'event_business_professional[organization_id]'

      assert_select 'input[name=?]', 'event_business_professional[event_id]'
    end
  end
end
