require "rails_helper"

RSpec.describe SiteController, type: :routing do
  describe "routing" do

    it "routes to #home" do
      expect(:get => "/").to route_to("site#home")
    end

    it "route to #contact" do
      expect(:get => "/contact").to route_to("site#contact")
    end
  end
end
