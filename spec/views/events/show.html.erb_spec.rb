require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              title: 'Title',
                              description: 'MyText',
                              creator: User.new,
                              location: 'Mylocation',
                              date: '2020-01-01'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
