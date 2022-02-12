# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('newsletters/index', type: :view) do
  before do
    assign(:newsletters, [
      Newsletter.create!(
        message: 'Message',
        title: 'Title'
      ),
      Newsletter.create!(
        message: 'Message',
        title: 'Title'
      )
    ]
    )
  end

  it 'renders a list of newsletters' do
    render
    assert_select 'tr>td', text: 'Message'.to_s, count: 2
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
  end
end
