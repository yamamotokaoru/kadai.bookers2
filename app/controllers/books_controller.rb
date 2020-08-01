class BooksController < ApplicationController
   
   before_action :authenticate_user!

 def index
    @user = current_user
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
      @user = current_user
      @books = Book.all
      render :index
    end
 end
 
 def show
    @books = Book.find(params[:id])
    @user = current_user
    @book = Book.new
 end
def edit
 @book = Book.find(params[:id])
 if @book.user.id == current_user.id 
            render "edit"
          else
            redirect_to books_path
end
end
def update
   @book = Book.find(params[:id])
   @book.update(book_params)
   if @book.save
   redirect_to book_path# 一覧画面へリダイレクト
   flash[:notice] = "Book was successfully updated."
   else
   render :edit
   end
end

def destroy
   @book = Book.find(params[:id]) #データ(レコード)を1件取得
   @book.destroy #データ（レコード）を削除
   redirect_to books_path
   flash[:notice] = "Book was successfully destroyed."
end
 private
    def book_params
        params.require(:book).permit(:title, :body)
    end
   end
