class PostsController < ApplicationController
  before_action :ensure_author, only: [:edit, :update]

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to sub_url(Sub.find(@post.sub_ids[0]))
    else
      render :new
    end
  end

  def index
    @sub = Sub.find(params[:sub_id])
    @posts = @subs.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to sub_url(@post.sub)
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, sub_ids: [])
  end

  def ensure_author
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to sub_url(@post.subs.first)
    end
  end
end
