require 'rails_helper'

RSpec.describe "trips/new", :type => :view do
  before(:each) do
    assign(:trip, Trip.new(
      :trip_name => "MyString",
      :location => "MyString",
      :user_id => 1,
      :to_pack => "MyText",
      :to_do => "MyText",
      :budget => 1
    ))
  end

  it "renders new trip form" do
    render

    assert_select "form[action=?][method=?]", trips_path, "post" do

      assert_select "input#trip_trip_name[name=?]", "trip[trip_name]"

      assert_select "input#trip_location[name=?]", "trip[location]"

      assert_select "input#trip_user_id[name=?]", "trip[user_id]"

      assert_select "textarea#trip_to_pack[name=?]", "trip[to_pack]"

      assert_select "textarea#trip_to_do[name=?]", "trip[to_do]"

      assert_select "input#trip_budget[name=?]", "trip[budget]"
    end
  end
end
