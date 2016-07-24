class BooksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:create, :edit, :update]
  before_action :admin_user, only: [:borrowed_books, :return, :given_away_books, :give_book]
  
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

  def borrowed_books
    #Returns all the borrowed books
    @books = Book.where(whereabouts: "borrowed")
  end

  def given_away_books
    @books = Book.where(whereabouts: "given_away")
  end

  def return
    @book =Book.find_by(id: params[:id])
    @book.update_attributes(whereabouts: "returned", bookstatus: "available", user_id: 1)
    redirect_to books_path
  end

  #Executes when admin gives away book
  def give_book
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: params[:borrower_id])
    #update whereabout to "give_away" so book does not appear in the borrowed books list anymore
    @book.update_attributes(bookstatus: "unavailable", whereabouts: "given_away", 
                            lend_time: Time.zone.now, due_date: 7.days.from_now, 
                            user_id: params[:borrower_id])
    flash[:success] = "The book #{@book.title} has now been lent away."

    redirect_to borrowed_path
  end

    def borrow
      #find book clicked
    @book = Book.find_by(id: params[:id])
    borrower_id = params[:user_id]
    @book.update_attributes(whereabouts: "borrowed", borrower_id: borrower_id)
    flash[:success] = "You have borrowed #{@book.title}"
    redirect_to books_path
    end

    private
  def book_params
  params.require(:book).permit(:title, :author, :description, :quantity, :isbn)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def correct_user
    @book = current_user.books.find_by(params[:id])
   # redirect_to root_url if @book.nil?
  end
end
