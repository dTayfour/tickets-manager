require 'rails_helper'

RSpec.describe Ticket, type: :model do
  before(:each) { Ticket.destroy_all }

  it 'is valid with a title' do
    ticket = Ticket.new(title: 'Test ticket')
    expect(ticket).to be_valid
  end

  it 'is invalid without a title' do
    ticket = Ticket.new(title: '')
    expect(ticket).not_to be_valid
    expect(ticket.errors[:title]).to include("can't be blank")
  end

  it 'sets default status and priority on save' do
    ticket = Ticket.create!(title: 'Defaults')
    expect(ticket.status).to eq('open')
    expect(ticket.priority).to eq('medium')
  end

  describe '.search' do
    before do
      Ticket.create!(title: 'Fix bug', description: 'authentication problem')
      Ticket.create!(title: 'Add feature', description: 'new UI')
    end

    it 'finds by title case-insensitive' do
      expect(Ticket.search('fix')).to include(Ticket.find_by(title: 'Fix bug'))
    end

    it 'finds by description case-insensitive' do
      expect(Ticket.search('authentication')).to include(Ticket.find_by(title: 'Fix bug'))
    end
  end
end
