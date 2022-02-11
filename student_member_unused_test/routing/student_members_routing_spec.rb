require "rails_helper"

RSpec.describe StudentMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/student_members").to route_to("student_members#index")
    end

    it "routes to #new" do
      expect(get: "/student_members/new").to route_to("student_members#new")
    end

    it "routes to #show" do
      expect(get: "/student_members/1").to route_to("student_members#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/student_members/1/edit").to route_to("student_members#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/student_members").to route_to("student_members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/student_members/1").to route_to("student_members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/student_members/1").to route_to("student_members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/student_members/1").to route_to("student_members#destroy", id: "1")
    end
  end
end
