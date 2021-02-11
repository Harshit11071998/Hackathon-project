class ChallengeCreate
  def initialize(params)
    @params = params
    # @tags = params[:tags]
  end

  def call
    @challenge = Challenge.new(@params)
  end
end
