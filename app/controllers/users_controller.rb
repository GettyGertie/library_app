class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
      flash[:success] = "You Are signed up!"
    else
      render 'new'
      flash[:danger] = "Invalid signup details. Please try again"
    end
  end
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirm)

  end

end
