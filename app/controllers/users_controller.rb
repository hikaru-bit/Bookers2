class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def index
    @book = Book.new
    @user = User
    @users = User.all
  end

end
