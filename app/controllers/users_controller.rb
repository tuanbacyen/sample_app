class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:success] = t("controllers.notfound")
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("controllers.welcome")
      redirect_to @user
    else
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
