class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      render json: @user
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to new_user_url
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
