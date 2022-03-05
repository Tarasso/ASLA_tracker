require "rails_helper"

RSpec.describe OfficerPicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/officer_pics").to route_to("officer_pics#index")
    end

    it "routes to #new" do
      expect(get: "/officer_pics/new").to route_to("officer_pics#new")
    end

    it "routes to #show" do
      expect(get: "/officer_pics/1").to route_to("officer_pics#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/officer_pics/1/edit").to route_to("officer_pics#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/officer_pics").to route_to("officer_pics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/officer_pics/1").to route_to("officer_pics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/officer_pics/1").to route_to("officer_pics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/officer_pics/1").to route_to("officer_pics#destroy", id: "1")
    end
  end
end
