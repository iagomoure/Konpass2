require "rails_helper"

RSpec.describe PointOfInterestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cities/1/pointsofinterest").to route_to("point_of_interests#index", :city_id => "1")
    end

  end
end
