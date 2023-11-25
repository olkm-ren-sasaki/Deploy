class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] ="You have created book successfully."
    redirect_to "/books/#{@book.id}"
  end
  
  def index
    @books = Book.all
    @book =  Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
