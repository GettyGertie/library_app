class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      redirect_to @user
    else
      render 'new'
      flash[:danger] = "Invalid email and password combination!
                        Please try again ..."
    end
  end

  def destroy
  end
end
