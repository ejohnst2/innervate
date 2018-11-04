class Api::V1::IdeasController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @ideas = Idea.order(created_at: :desc)
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
