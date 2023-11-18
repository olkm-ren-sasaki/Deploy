class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/books/show'
  end
  def index
    @books = Book.all
    @book =  Book.new
    @user = current_user
  end

  def show
   @books = Book.all
    @book =  Book.new
    @user = current_user
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
