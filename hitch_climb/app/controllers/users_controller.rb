class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(4)
    @favorite_events = @user.favorite_events
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end

end


