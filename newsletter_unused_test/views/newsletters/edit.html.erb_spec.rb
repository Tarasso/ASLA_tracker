# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('newsletters/edit', type: :view) do
  before do
    @newsletter = assign(:newsletter, Newsletter.create!(
                                        message: 'MyString',
                                        title: 'MyString'
                                      )
    )
  end

  it 'renders the edit newsletter form' do
    render

    assert_select 'form[action=?][method=?]', newsletter_path(@newsletter), 'post' do
      assert_select 'input[name=?]', 'newsletter[message]'

      assert_select 'input[name=?]', 'newsletter[title]'
    end
  end
end
