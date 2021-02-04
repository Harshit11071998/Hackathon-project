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
      get challenge_index_url
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST /create" do
    context "with valid parameters" do
      it "create a new challenge" do
        valid_attributes[:tags] = "String,Tags"
        expect {
          post challenge_index_url, params: { challenge: valid_attributes }
        }.to change(Challenge, :count).by(1)
      end
      it "redirect to the root path" do
        post challenge_index_url, params: { challenge: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
    context "with invalid attributes" do
      it "does not create a new challenge" do
        expect {
          post challenge_index_url, params: { challenge: invalid_attributes }
        }.to change(Challenge, :count).by(0)
      end
    end
  end
end
