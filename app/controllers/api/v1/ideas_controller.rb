class Api::V1::IdeasController < ActionController::Base
  def index
    @ideas = Idea.order(created_at: :desc)
    render json: @ideas
  end

  def show
    @idea = Idea.find(params[:id])
    render json: @idea
  end

  def create
    @idea = Idea.create(idea_params)
    render json: @idea
  end

  private

  def idea_params
    params.require(:idea).permit(:content, :category)
  end

end
