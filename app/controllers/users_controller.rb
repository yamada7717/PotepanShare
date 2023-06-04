class UsersController < ApplicationController
  #ログイン時のみ実行する
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit

  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :bio, :user_image)
  end
end
