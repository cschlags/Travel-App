require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :provider => "Provider",
        :uid => "Uid",
        :email => "Email",
        :image => "Image",
        :oauth_token => "Oauth Token"
      ),
      User.create!(
        :name => "Name",
        :provider => "Provider",
        :uid => "Uid",
        :email => "Email",
        :image => "Image",
        :oauth_token => "Oauth Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Token".to_s, :count => 2
  end
end
