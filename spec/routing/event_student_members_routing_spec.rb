require "rails_helper"

RSpec.describe EventStudentMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/event_student_members").to route_to("event_student_members#index")
    end

    it "routes to #new" do
      expect(get: "/event_student_members/new").to route_to("event_student_members#new")
    end

    it "routes to #show" do
      expect(get: "/event_student_members/1").to route_to("event_student_members#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/event_student_members/1/edit").to route_to("event_student_members#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/event_student_members").to route_to("event_student_members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/event_student_members/1").to route_to("event_student_members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/event_student_members/1").to route_to("event_student_members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/event_student_members/1").to route_to("event_student_members#destroy", id: "1")
    end
  end
end
