class UsersController < ApplicationController
  before_action :set_user, only: %i[ update ]

  def index
    @user = User.find_by(username: params[:username])
    @posts = @user.posts.order(created_at: :desc)
  end

  def update
    @user.update(user_params)
    redirect_to profile_path(@user.username)
  end

  private

  def set_user
    @user= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
