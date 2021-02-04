require "rails_helper"

RSpec.describe ChallengeController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/challenge").to route_to("challenge#index")
    end

    it "routes to #create" do
      expect(post: "/challenge").to route_to("challenge#create")
    end

    it "routes to #destroy" do
      expect(delete: "/challenge/1").to route_to("challenge#destroy", id: "1")
    end
  end
end
