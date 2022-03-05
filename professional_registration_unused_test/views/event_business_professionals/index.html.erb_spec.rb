# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('event_business_professionals/index', type: :view) do
  before do
    assign(:event_business_professionals, [
      EventBusinessProfessional.create!(
        organization_id: 2,
        event_id: 3
      ),
      EventBusinessProfessional.create!(
        organization_id: 2,
        event_id: 3
      )
    ]
    )
  end

  it 'renders a list of event_business_professionals' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
