require 'rails_helper'

RSpec.describe PointOfInterestsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:create_city) {City.create(name: "City 1")}

  describe "GET #index" do
    before(:each) do
      create_city
      get :index, :city_id => "1", :city => "City 1"
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

  end
end


# it "gets an empty array if no cities exist" do
#      expect(assigns(:create_city)).to match_array([])
#    end
# end
#   it "gets an array of companies" do
#     companies = [create(:company), create(:company)]
#     expect(assigns(:companies)).to match_array(companies)
#   end
# end
