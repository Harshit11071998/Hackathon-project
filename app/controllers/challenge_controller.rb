class ChallengeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if params[:sort] == "most_votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }.reverse
    elsif params[:sort] == "least_votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }
    else
      @challenges = Challenge.order(params[:sort])
    end
    @challenge = Challenge.new(user: current_user)
    # @challenge.user = current_user
  end

  def create
    @challenge = Challenge.new(set_params)
    @challenge.user = current_user
    if @challenge.save
      redirect_to root_path, notice: "challenge created"
    else
      redirect_to root_path, alert: "Error: challenge not saved"
    end
  end

  private

  def set_params
    params.require(:challenge).permit(:title, :description, :tags, :user_id)
  end
end
