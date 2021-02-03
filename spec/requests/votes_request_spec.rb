# require "rails_helper"

# RSpec.describe "Votes", type: :request do
#   let(:user) { create(:user) }
#   let(:challenge) { create(:challenge, user: user) }
#   let(:valid_params) do
#     {
#       vote: {
#         user_id: challenge["user_id"],
#         challenge_id: challenge["id"],
#       },
#     }
#   end
#   before(:each) do
#     sign_in(user)
#     challenge.user = user
#   end
#   describe "POST /create" do
#     context "with valid params" do
#       it "create a new votes" do
#         expect {
#           post challenge_vote_url(challenge_id: challenge["id"]), params: valid_params
#         }.to change(Vote, :count).by(1)
#       end
#     end
#   end
#   # describe "DELETE /destroy" do
#   #   it "destroy a new votes" do
#   #     expect {
#   #       delete challenge_vote_url(challenge_id: challenge["id"]), params: valid_params
#   #     }.to change(Vote, :count).by(-1)
#   #   end
#   # end
# end
