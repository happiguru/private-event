require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "Name",
      username: "Username"
    ))
  end

  it "renders attributes in <h1>" do
    render
    expect(rendered).to match(/Name/)
  end
end
