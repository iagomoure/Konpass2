require 'rails_helper'

RSpec.describe SiteController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #home" do
    before(:each) do
      get :home
    end

    it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

    it "renders the index template" do
      expect(response).to render_template(:home)
    end
  end

  describe "GET #contact" do
    before(:each) do
      get :contact
    end

    it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

    it "renders the contact template" do
      get :contact
      expect(response).to render_template(:contact)
    end
  end
end
