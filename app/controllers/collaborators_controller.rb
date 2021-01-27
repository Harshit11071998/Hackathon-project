class CollaboratorsController < ApplicationController
  before_action :authenticate_user!

  def create
    challenge = Challenge.find(params[:challenge_id])
    challenge.collaborate.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    challenge = Challenge.find(params[:challenge_id])
    challenge.collaborate.where(user: current_user).take.try(:destroy)
    redirect_back(fallback_location: root_path)
  end
end
