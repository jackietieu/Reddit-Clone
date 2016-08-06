class SubsController < ApplicationController
  before_action :ensure_moderator, except: [:show, :index, :new, :create]

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def new
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update(sub_params)
    redirect_to sub_url(@sub)
  end

  def index
    @subs = Sub.all
  end

  def destroy

  end

  private
  def ensure_moderator
    @sub = Sub.find(params[:id])

    if current_user.id != @sub.user_id
      redirect_to sub_url(@sub)
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
