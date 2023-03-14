require 'rails_helper'

RSpec.describe Note, type: :model do
  
  it 'is not valid with missing title' do
    note = create(:note)
    note.title = nil
    result = note.save
    expect(result).to be false
  end

  it 'is not valid with missing body' do
    note = create(:note)
    note.body = nil
    result = note.save
    expect(result).to be false
  end

  it 'is not valid with missing date' do
    note = create(:note)
    note.date = nil
    result = note.save
    expect(result).to be false
  end

  it 'is valid with all attributes' do
    note = create(:note)
    result = note.save
    expect(result).to be true
  end

  it 'search by title' do
    %w(first second third).map do |title|
      FactoryBot.create(:note, title: title)
    end
    q = 'sec'
    expect(Note.search(q).size).to eq(1)
  end

  it 'search by body content' do
    ['first body', 'second body', 'third body'].map do |body|
      FactoryBot.create(:note, body: body)
    end
    q = 'd body'
    expect(Note.search(q).size).to eq(2)
  end
end
