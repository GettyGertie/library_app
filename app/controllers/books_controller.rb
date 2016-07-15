class BooksController < ApplicationController
  def new
    @book = User.new
  end

  def create
    @book = User.new(params[:book])
    if
      @user.save!
      redirecr
  end
end
