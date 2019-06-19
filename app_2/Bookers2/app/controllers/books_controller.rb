class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		@book = Book.new
	end

	def show
		@new_book = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end

	end

	def index
		@new_book = Book.new
		@books = Book.all
		@user = User.find(current_user.id)
	end

	def create
		@user = User.find(current_user.id)
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		if @new_book.save
		flash[:notice] = "Book was successfully created."
		redirect_to book_path(@new_book.id)
	else
    	@books = Book.all
    	render :index
	end
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
		flash[:notice] = "Book was successfully destroyed."
		redirect_to books_path
	else
		@books = Book.all
    	render :index
    end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		flash[:notice] = "Book was successfully updated."
		redirect_to book_path(params[:id])
	else
		@books = Book.all
    	render :edit
    end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
