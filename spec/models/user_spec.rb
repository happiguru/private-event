require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: 'name', username: 'username') }

  context 'Creating a user' do
    it 'creates a user in the User model' do
      expect(user).to be_an User
    end
  end

  context 'Test validations' do
    it 'does not create a user if no username provided' do
      user.username = ''
      expect(user).not_to be_valid
    end

    it 'does not create a user if no name provided' do
      user.name = ''
      expect(user).not_to be_valid
    end
  end

  context 'Association test for User' do
    it 'should have many created_events' do
      u = User.reflect_on_association(:created_events)
      expect(u.macro).to eq(:has_many)
    end

    it 'should have many attended_events' do
      u = User.reflect_on_association(:attended_events)
      expect(u.macro).to eq(:has_many)
    end

    it 'should have many invitations' do
      u = User.reflect_on_association(:invitations)
      expect(u.macro).to eq(:has_many)
    end
  end
end
