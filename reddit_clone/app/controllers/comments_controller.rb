class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    render :new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
