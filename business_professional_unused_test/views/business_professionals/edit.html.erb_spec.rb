# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('business_professionals/edit', type: :view) do
  before do
    @business_professional = assign(:business_professional, BusinessProfessional.create!(
                                                              org_name: 'MyString',
                                                              first_name: 'MyString',
                                                              last_name: 'MyString',
                                                              phone_num: 'MyString',
                                                              email: 'MyString'
                                                            )
    )
  end

  it 'renders the edit business_professional form' do
    render

    assert_select 'form[action=?][method=?]', business_professional_path(@business_professional), 'post' do
      assert_select 'input[name=?]', 'business_professional[org_name]'

      assert_select 'input[name=?]', 'business_professional[first_name]'

      assert_select 'input[name=?]', 'business_professional[last_name]'

      assert_select 'input[name=?]', 'business_professional[phone_num]'

      assert_select 'input[name=?]', 'business_professional[email]'
    end
  end
end
