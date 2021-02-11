class ChallengesController < ApplicationController
  # include ChallengeService
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @challenges = ChallengeSortSearch.new(params).call
    @challenge = Challenge.new(user: current_user)
  end

  def create
    @challenge = ChallengeCreate.new(set_params.merge(user: current_user).except(:tags)).call
    if @challenge.save
      @tag = ChallengeTag.new(@challenge.id, params[:challenge][:tags]).call
      redirect_to root_path, notice: "Challenge Created"
    else
      redirect_to root_path, alert: "Error: Challenge Not Saved"
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to root_path, notice: "Challenge Deleted"
  end

  private

  def set_params
    params.require(:challenge).permit(:title, :description, :user_id, :tags)
  end
end
