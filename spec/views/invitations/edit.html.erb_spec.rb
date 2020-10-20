require 'rails_helper'

RSpec.describe "invitations/edit", type: :view do
  before(:each) do
    @invitation = assign(:invitation, Invitation.create!(
      accepted: false
    ))
  end

  it "renders the edit invitation form" do
    render

    assert_select "form[action=?][method=?]", invitation_path(@invitation), "post" do

      assert_select "input[name=?]", "invitation[accepted]"
    end
  end
end
