class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:danger] = t ".notfound"
      redirect_to root_path
    end
  end

  def new
  end

end
