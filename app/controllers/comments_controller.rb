class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @sub = Sub.find(params[:sub_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to sub_post_url(params[:sub_id], params[:post_id])
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
