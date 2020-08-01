class UsersController < ApplicationController

  before_action :authenticate_user!
  def show
    @user = User.find(params[:id]) # ここを記述
    @books = @user.books.reverse_order  # ここを記述
    @book = Book.new
  end
  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to user_path(current_user.id)
   end
  end
def update
  @user = User.find(params[:id])
  @user.update(user_params)
  if @user.save
  redirect_to user_path(@user.id)
  flash[:notice] = "User was successfully updated."
  else
    render :edit
  end
end
def index
  @users = User.all 
  @user = current_user
  @book = Book.new
  @books = Book.all
end

private 
def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
end
