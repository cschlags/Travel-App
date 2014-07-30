require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :provider => "Provider",
      :uid => "Uid",
      :email => "Email",
      :image => "Image",
      :oauth_token => "Oauth Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Oauth Token/)
  end
end
