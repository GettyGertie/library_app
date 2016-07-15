class BooksController < ApplicationController
  def new
    @book = User.new
  end

#   def create
#     @book = User.new
#     if
#       @book.save!
#       redirect_to @book
#     else
#       render 'new'
#       flash[:fail]= "Invalid book details"
#     end
#   end

#   private
#   params.require(:user).permit(:title, :author, :description)
end
