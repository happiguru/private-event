require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               name: 'Name1',
               username: 'Username1'
             ),
             User.create!(
               name: 'Name2',
               username: 'Username2'
             )
           ])
  end

  it 'renders a list of users' do
    render
    expect(rendered).to match(/Name1/)
    expect(rendered).to match(/Name2/)
  end
end
