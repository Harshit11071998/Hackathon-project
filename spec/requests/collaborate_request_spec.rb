require "rails_helper"

RSpec.describe "Collaborates", type: :request do
  let!(:user) { create(:user, empid: "E01") }
  let!(:challenge) { create(:challenge, user: user) }
  let!(:valid_params) do
    {
      collaborate: {
        user_id: challenge["user_id"],
        challenge_id: challenge["id"],
      },
    }
  end
  before(:each) do
    sign_in(user)
    # challenge.user = user
  end
  describe "POST /create" do
    context "with valid params" do
      it "create a new collaboration" do
        expect {
          post challenge_collaborator_url(challenge_id: challenge["id"]), params: valid_params
        }.to change(Collaborate, :count).by(1)
      end
    end
  end
  describe "DELETE /destroy" do
    it "destroy a new votes" do
      vote = create(:collaborate, user_id: user.id, challenge_id: challenge.id)
      expect {
        delete challenge_collaborator_url(challenge)
      }.to change(Collaborate, :count).by(-1)
    end
  end
end
