class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create,:show]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  # def show
    # @comment = Comment.new
    # @comments = @prototype.comment.includes(:prototype)
  # end


  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
