# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('business_professionals/show', type: :view) do
  before do
    @business_professional = assign(:business_professional, BusinessProfessional.create!(
                                                              org_name: 'Org Name',
                                                              first_name: 'First Name',
                                                              last_name: 'Last Name',
                                                              phone_num: 'Phone Num',
                                                              email: 'Email'
                                                            )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Org Name/))
    expect(rendered).to(match(/First Name/))
    expect(rendered).to(match(/Last Name/))
    expect(rendered).to(match(/Phone Num/))
    expect(rendered).to(match(/Email/))
  end
end
