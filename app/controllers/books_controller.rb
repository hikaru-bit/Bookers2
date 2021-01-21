class BooksController < ApplicationController

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  end

  def index
    @user = User
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = User
    @book = Book.find(params[:id])
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

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
