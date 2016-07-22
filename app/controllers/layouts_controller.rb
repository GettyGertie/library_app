class LayoutsController < ApplicationController
  def home
    @book = current_user.books.build if logged_in?
  end

  def contact
  end

  def about
  end

end
