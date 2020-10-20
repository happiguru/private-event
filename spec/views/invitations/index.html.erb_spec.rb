require 'rails_helper'

RSpec.describe "invitations/index", type: :view do
  before(:each) do
    assign(:invitations, [
      Invitation.create!(
        accepted: false
      ),
      Invitation.create!(
        accepted: false
      )
    ])
  end

  it "renders a list of invitations" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
