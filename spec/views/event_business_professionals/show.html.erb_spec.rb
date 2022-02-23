require 'rails_helper'

RSpec.describe "event_business_professionals/show", type: :view do
  before(:each) do
    @event_business_professional = assign(:event_business_professional, EventBusinessProfessional.create!(
      organization_id: 2,
      event_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
