class BooksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:create, :edit, :update]
  def new
    @book = Book.new
  end

  def create
    # @book = Book.new(book_params)
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
      flash[:fail]= "Invalid book details"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:yes] = "Successful update"
      redirect_to @book
    else
      render 'new'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Book deleted"
    redirect_to request.referrer || root_url
    end
    
    private
  def book_params
  params.require(:book).permit(:title, :author, :description)
  end

  def correct_user
    @book = current_user.books.find_by(params[:id])
   # redirect_to root_url if @book.nil?
  end
end
