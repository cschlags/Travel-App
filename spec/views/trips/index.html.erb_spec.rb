require 'rails_helper'

RSpec.describe "trips/index", :type => :view do
  before(:each) do
    assign(:trips, [
      Trip.create!(
        :trip_name => "Trip Name",
        :location => "Location",
        :user_id => 1,
        :to_pack => "MyText",
        :to_do => "MyText",
        :budget => 2
      ),
      Trip.create!(
        :trip_name => "Trip Name",
        :location => "Location",
        :user_id => 1,
        :to_pack => "MyText",
        :to_do => "MyText",
        :budget => 2
      )
    ])
  end

  it "renders a list of trips" do
    render
    assert_select "tr>td", :text => "Trip Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
