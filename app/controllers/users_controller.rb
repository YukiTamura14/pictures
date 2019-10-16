class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "登録しました！"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @pictures = @user.favorites
    @login_user_pic = current_user.pictures
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
