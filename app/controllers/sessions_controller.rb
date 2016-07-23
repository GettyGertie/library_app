class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if !user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # check_for_delayed_books
        if user.books.any?
          @books = user.books
          @books.each do |bk|
            due_date = bk.due_date
            if due_date >= Time.zone.now
              # send_book_due_email
            end
          end
        end

       redirect_to books_path
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
     else

      render 'new'
      flash[:danger] = 'Invalid email and password combination'

    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
