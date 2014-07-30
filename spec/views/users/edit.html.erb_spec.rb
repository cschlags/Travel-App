require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :provider => "MyString",
      :uid => "MyString",
      :email => "MyString",
      :image => "MyString",
      :oauth_token => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_provider[name=?]", "user[provider]"

      assert_select "input#user_uid[name=?]", "user[uid]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_image[name=?]", "user[image]"

      assert_select "input#user_oauth_token[name=?]", "user[oauth_token]"
    end
  end
end
