require 'rails_helper'

RSpec.describe "invitations/show", type: :view do
  before(:each) do
    @invitation = assign(:invitation, Invitation.create!(
      accepted: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
  end
end
