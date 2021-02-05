class ChallengesController < ApplicationController
  # before_action :authenticate_user!

  def index
    if params[:sort] == "most_votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }.reverse
    elsif params[:sort] == "least_votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }
    elsif params[:title_search]
      @challenges = Challenge.where("title LIKE ?", "%#{params[:title_search]}%")
    elsif params[:employee_search]
      @challenges = Challenge.where("user_id LIKE ?", "%#{params[:employee_search]}%")
    else
      @challenges = Challenge.order(params[:sort])
    end
    @challenge = Challenge.new(user: current_user)
    # @challenge.user = current_user
  end

  def create
    # @challenge = current_user.challenges.build(title: params[:challenge][:title], description: params[:challenge][:description])
    @challenge = Challenge.new(title: params[:challenge][:title], description: params[:challenge][:description])
    @challenge.user = current_user
    if @challenge.save
      tag_string = params[:challenge][:tags]
      tag_array = tag_string.split(",")
      tag_array.each do |tag_name|
        @challenge.tags.create(name: tag_name)
      end
      redirect_to root_path, notice: "challenge created"
    else
      redirect_to root_path, alert: "Error: challenge not saved"
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to root_path, notice: "Challenge Deleted"
  end

  private

  def set_params
    params.require(:challenge).permit(:title, :description, :tags, :user_id)
  end
end
