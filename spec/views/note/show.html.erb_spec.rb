require 'rails_helper'

RSpec.describe 'notes/show', type: :view do
  before(:each) do
    @note = create(:note)
  end

  it 'render note attributes' do
    render
    expect(rendered).to match(@note.title)
    expect(rendered).to match(@note.body)
  end
end
