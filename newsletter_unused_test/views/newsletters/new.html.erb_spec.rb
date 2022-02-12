# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('newsletters/new', type: :view) do
  before do
    assign(:newsletter, Newsletter.new(
                          message: 'MyString',
                          title: 'MyString'
                        )
    )
  end

  it 'renders new newsletter form' do
    render

    assert_select 'form[action=?][method=?]', newsletters_path, 'post' do
      assert_select 'input[name=?]', 'newsletter[message]'

      assert_select 'input[name=?]', 'newsletter[title]'
    end
  end
end
