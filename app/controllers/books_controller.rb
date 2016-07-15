class BooksController < ApplicationController
  def new
    @book = User.new
  end

  def create
    @book = User.new(params[:book])
  end
end
