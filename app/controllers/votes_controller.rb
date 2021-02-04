class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge.votes.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @challenge = Challenge.find(params[:challenge_id])
    # @challenge.votes.where(user: current_user).take.try(:destroy)
    # debugger
    Vote.find_by(user: current_user, challenge: @challenge).destroy

    redirect_back(fallback_location: root_path)
  end
end
