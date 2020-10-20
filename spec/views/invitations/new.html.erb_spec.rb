require 'rails_helper'

RSpec.describe "invitations/new", type: :view do
  before(:each) do
    assign(:invitation, Invitation.new(
      accepted: false
    ))
  end

  it "renders new invitation form" do
    render

    assert_select "form[action=?][method=?]", invitations_path, "post" do

      assert_select "input[name=?]", "invitation[accepted]"
    end
  end
end
