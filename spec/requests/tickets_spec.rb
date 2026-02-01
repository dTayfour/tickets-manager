require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  before(:each) { Ticket.destroy_all }

  describe 'GET /tickets' do
    before do
      Ticket.create!(title: 'Find me', description: 'searchable')
      Ticket.create!(title: 'Other', description: 'not relevant')
    end

    it 'returns 200 and lists tickets' do
      get tickets_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Find me')
    end

    it 'filters by search param' do
      get tickets_path, params: { search: 'find' }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Find me')
      expect(response.body).not_to include('Other')
    end
  end

  describe 'POST /tickets' do
    it 'creates a ticket and redirects to show' do
      expect {
        post tickets_path, params: { ticket: { title: 'New Ticket', description: 'desc' } }
      }.to change(Ticket, :count).by(1)

      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response.body).to include('New Ticket')
    end
  end
end
