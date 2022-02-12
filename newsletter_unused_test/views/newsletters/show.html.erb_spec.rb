# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('newsletters/show', type: :view) do
  before do
    @newsletter = assign(:newsletter, Newsletter.create!(
                                        message: 'Message',
                                        title: 'Title'
                                      )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Message/))
    expect(rendered).to(match(/Title/))
  end
end
