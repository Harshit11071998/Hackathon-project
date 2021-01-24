class ChallengeController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_params

  def index
    @challenges = Challenge.all
    @challenge = Challenge.new
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
