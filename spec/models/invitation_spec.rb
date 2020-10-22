require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'Association test for invitation' do
    it 'should belong to attendees' do
      i = Invitation.reflect_on_association(:attendee)
      expect(i.macro).to eq(:belongs_to)
    end

    it 'should belong to attended_events' do
      i = Invitation.reflect_on_association(:attended_event)
      expect(i.macro).to eq(:belongs_to)
    end
  end
end
