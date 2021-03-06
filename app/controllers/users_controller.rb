class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render "users/new"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
