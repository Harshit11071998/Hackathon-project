require "rails_helper"

RSpec.describe ChallengesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/challenges").to route_to("challenges#index")
    end

    it "routes to #create" do
      expect(post: "/challenges").to route_to("challenges#create")
    end

    it "routes to #destroy" do
      expect(delete: "/challenges/1").to route_to("challenges#destroy", id: "1")
    end
  end
end
