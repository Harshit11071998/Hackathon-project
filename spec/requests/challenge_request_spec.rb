require "rails_helper"

RSpec.describe "Challenges", type: :request do
  let!(:user) { create(:user, empid: "E01") }
  let!(:challenge) { create(:challenge, user_id: user.id) }
  # let(:tags) { create_list(:tag, 2, :challenge => challenge) }
  let(:invalid_attributes) {
    { title: "", description: "" }
  }
  before(:each) do
    sign_in(user)
    #user.empid = 1
  end
  valid_attributes = FactoryBot.attributes_for(:challenge)
  describe "GET /index" do
    it "returns http success" do
      get challenges_url
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST /create" do
    context "with valid parameters" do
      it "create a new challenge" do
        valid_attributes[:tags] = "String,Tags"
        expect {
          post challenges_url, params: { challenge: valid_attributes }
        }.to change(Challenge, :count).by(1)
      end
      it "redirect to the root path" do
        post challenges_url, params: { challenge: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
    context "with invalid attributes" do
      it "does not create a new challenge" do
        expect {
          post challenges_url, params: { challenge: invalid_attributes }
        }.to change(Challenge, :count).by(0)
      end
    end
  end
  describe "DELETE /destroy" do
    it "destroy the challenge" do
      expect {
        delete challenge_url(challenge)
      }.to change(Challenge, :count).by(-1)
    end
    it "redirect to the root path" do
      delete challenge_url(challenge)
      expect(response).to redirect_to(root_path)
    end
  end
end
