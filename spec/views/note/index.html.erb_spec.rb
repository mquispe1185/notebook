require 'rails_helper'

RSpec.describe 'notes/index', type: :view do
  before(:each) do
    @notes = create_list(:note, 10)
  end

  it 'render list of notes' do
    render
    expect(rendered).to match(@notes.first.title)
    expect(rendered).to match(@notes.last.body)
  end
end
