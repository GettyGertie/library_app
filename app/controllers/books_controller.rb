class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
      flash[:fail]= "Invalid book details"
    end
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  def index
    @book = Book.all
  end

  def destroy
  end
  private
  def book_params
  params.require(:book).permit(:title, :author, :description)
  end
end
