class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def new
    @user = User.new
    #Define an instance of a user with its params
  end

  def create
    #this is the create action it necessarily requires a new global variable even after the new action has one.
    @user = User.new(user_params)
    # !verify_recaptcha(model: @user, message: captcha_message) || !@user.save
    if @user.save
      # UserMailer.account_activation(@user).deliver_now
     @user.send_activation_email
  log_in @user     
      flash[:success] = "Please check your email to activate your account."
      redirect_to @user
       else
      render 'new'
      flash.now[:danger] = "Invalid signup details. Please try again"
    end
  end

  def show
    @user = current_user
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      # Handle a successful update.
      else
      render 'edit'
      end
      end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end


      def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
      end

      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end
  end

