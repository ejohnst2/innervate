class Api::V1::IdeasController < Api::V1::BaseController

  def index
    @ideas = policy_scope(Idea).order(created_at: :desc)
    render json: @ideas
  end

  def show
    @idea = Idea.find(params[:id])
    render json: @idea
  end

  def create
    @idea = Idea.create(
      content: params[:content],
      category: params[:category],
      user: User.find(3),
      channel: "react",
      stage: "seed"
    )
    render json: @idea
  end

  private

  # def idea_params
  #   params.require(:idea).permit(:content, :category)
  # end

end
