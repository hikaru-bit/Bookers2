class BooksController < ApplicationController

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
    else
        @books = Book.all
        @user = current_user
        render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @book2 = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
			redirect_to books_path
		end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
			redirect_to books_path
    else
    @book.destroy
    redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :use_id)
  end

end
