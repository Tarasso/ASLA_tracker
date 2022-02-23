require 'rails_helper'

RSpec.describe "event_business_professionals/edit", type: :view do
  before(:each) do
    @event_business_professional = assign(:event_business_professional, EventBusinessProfessional.create!(
      organization_id: 1,
      event_id: 1
    ))
  end

  it "renders the edit event_business_professional form" do
    render

    assert_select "form[action=?][method=?]", event_business_professional_path(@event_business_professional), "post" do

      assert_select "input[name=?]", "event_business_professional[organization_id]"

      assert_select "input[name=?]", "event_business_professional[event_id]"
    end
  end
end
