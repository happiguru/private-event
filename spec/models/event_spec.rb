require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) do
    Event.new(title: 'title', date: '2020-1-1', description: 'description',
              location: 'location', creator_id: 1)
  end

  # context 'Creating an Event' do
  #   it 'creates an event' do
  #     expect(event).to be_an Event
  #   end
  # end

  context 'Validation of the Event' do
    it 'valid event title' do
      # event.title = ''
      expect(event.title).not_to be_empty
    end

    it 'valid location' do
      event.location = ''
      expect(event).not_to be_valid
    end

    it 'valid date' do
      event.date = ''
      expect(event).not_to be_valid
    end

    it 'valid description' do
      event.description = ''
      expect(event).not_to be_valid
    end
  end

  context 'Association test for event models' do
    it 'should have many attendeees' do
      t = Event.reflect_on_association(:attendees)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many invitations' do
      t = Event.reflect_on_association(:invitations)
      expect(t.macro).to eq(:has_many)
    end
    it 'should belong to the creator' do
      t = Event.reflect_on_association(:creator)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
