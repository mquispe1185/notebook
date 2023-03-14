require 'rails_helper'

RSpec.describe "Notes", type: :request do
  let(:valid_attributes) {
    {
      title: 'New Title',
      body: 'It is a note content.',
      date: Date.today
    }
  }

  let(:invalid_attributes) {
    {
      title: 'Another Title',
      body: 'It is another content.'
    }
  }

  before(:each) do
    @notes = create_list(:note, 10)
    custom_note = create(:note, title: 'custom note')
    @notes << custom_note
  end

  describe "GET /notes" do
    it "display all notes" do
      get notes_path
      expect(response).to have_http_status(200)
      expect(@controller.view_assigns['notes'].size).to eq(11)
    end

    it "filter notes by title or body" do
      get notes_path, params: {q: 'custom note'}
      expect(response).to have_http_status(200)
      expect(@controller.view_assigns['notes'].size).to eq(1)
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: 'updated title',
          body: 'It is a note content.',
          date: Date.today
        }
      }

      it "updates the requested note and redirects to the note" do
        note = Note.create! valid_attributes
        patch note_url(note), params: { note: new_attributes }
        note.reload
        expect(note.title).to eq('updated title')
        expect(response).to redirect_to(note_url(note))
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Note" do
        expect {
          post notes_url, params: { note: valid_attributes }
        }.to change(Note, :count).by(1)

        note = Note.last
        expect(note.title).to eq('New Title')
        expect(note.body).to eq('It is a note content.')
        expect(note.date).to eq(Date.today)  
      end

      it "does not create a new Note" do
        expect {
          post notes_url, params: { note: invalid_attributes }
        }.to change(Note, :count).by(0)
      end
    end
  end


  describe "DELETE /destroy" do
    it "destroys the requested note" do
      note = Note.create! valid_attributes
      expect {
        delete note_url(note)
      }.to change(Note, :count).by(-1)
      expect(response).to redirect_to(notes_url)
    end
  end
end
