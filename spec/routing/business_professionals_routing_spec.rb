require "rails_helper"

RSpec.describe BusinessProfessionalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/business_professionals").to route_to("business_professionals#index")
    end

    it "routes to #new" do
      expect(get: "/business_professionals/new").to route_to("business_professionals#new")
    end

    it "routes to #show" do
      expect(get: "/business_professionals/1").to route_to("business_professionals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/business_professionals/1/edit").to route_to("business_professionals#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/business_professionals").to route_to("business_professionals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/business_professionals/1").to route_to("business_professionals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/business_professionals/1").to route_to("business_professionals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/business_professionals/1").to route_to("business_professionals#destroy", id: "1")
    end
  end
end
