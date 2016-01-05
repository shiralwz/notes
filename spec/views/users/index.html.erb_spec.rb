require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :username => "Username",
        :password_digest => "Password Digest",
        :user_bio => "User Bio"
      ),
      stub_model(User,
        :username => "Username",
        :password_digest => "Password Digest",
        :user_bio => "User Bio"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "User Bio".to_s, :count => 2
  end
end
