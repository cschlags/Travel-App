require 'rails_helper'

RSpec.describe "trips/show", :type => :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :trip_name => "Trip Name",
      :location => "Location",
      :user_id => 1,
      :to_pack => "MyText",
      :to_do => "MyText",
      :budget => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Trip Name/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
