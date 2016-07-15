class BooksController < ApplicationController
  def new
    @book = User.new
  end


end
