class ChallengeTag
  def initialize(challenge_id, params)
    @challenge_id = challenge_id
    @params = params
  end

  def call
    create_tag
  end

  private

  def create_tag
    tag_string = @params
    tag_array = tag_string.split(",")
    tag_array.each do |tag_name|
      Tag.create(name: tag_name, challenge_id: @challenge_id)
    end
  end
end
