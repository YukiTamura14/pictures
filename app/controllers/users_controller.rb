class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to pictures_path(session[:user_id]), notice: "登録しました！"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @pictures = @user.favorites
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    # redirect_to pictures_path unless @user.id == current_user.id
  end
end
