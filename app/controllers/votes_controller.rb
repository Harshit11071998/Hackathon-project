class VotesController < ApplicationController
  def create
    challenge = Challenge.find(params[:challenge_id])
    challenge.votes.create(user: current_user)
    redirect_to request.referrer
  end

  def destroy
    challenge = Challenge.find(params[:challenge_id])
    challenge.votes.where(user: current_user).take.try(:destroy)
    redirect_to request.referrer
  end
end
