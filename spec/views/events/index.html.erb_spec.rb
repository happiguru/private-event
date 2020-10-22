require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        title: "Title",
        description: "MyText",
        creator: User.new,
      location: "Mylocation",
      date: "2020-01-01"
      ),
      Event.create!(
        title: "Title",
        description: "MyText",
        creator: User.new,
      location: "Mylocation",
      date: "2020-01-01"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Mylocation".to_s, count: 2
    #assert_select "tr>td", text: "2020-01-01".to_s, count: 2
  end
end
