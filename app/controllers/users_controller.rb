class UsersController < ApplicationController
  #ログイン時のみ実行する
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :bio, :user_image)
  end
end
