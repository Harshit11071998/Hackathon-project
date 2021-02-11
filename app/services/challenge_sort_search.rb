class ChallengeSortSearch
  def initialize(params)
    @params = params
  end

  def call
    action
  end

  private

  def action
    if @params[:sort] == "most_votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }.reverse.paginate(page: @params[:page], :per_page => 5)
    elsif @params[:sort] == "least_votes"
      @challenges = Challenge.all.sort_by { |challenge| challenge.votes.count }.paginate(page: @params[:page], :per_page => 5)
    elsif @params[:title_search]
      @challenges = Challenge.where("title LIKE ?", "%#{@params[:title_search]}%")
    elsif @params[:employee_search]
      @challenges = Challenge.where("user_id LIKE ?", "%#{@params[:employee_search]}%")
    else
      @challenges = Challenge.paginate(page: @params[:page]).order(@params[:sort])
    end
  end
end
