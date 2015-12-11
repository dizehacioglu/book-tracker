class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
	  @book = Book.new(book_params)
		# p GoogleBooks.search(@book.title).first.image_link
	  @book.update({:cover => GoogleBooks.search(@book.title).first.image_link})
	 
	  @book.save
	  redirect_to books_path
	end

	def update
	  @book = Book.find(params[:id])
	 
	  @book.update(book_params)
	  @book.update({:cover => GoogleBooks.search(@book.title).first.image_link})
	  redirect_to books_path
	end

	def destroy
	  @book = Book.find(params[:id])
	  @book.destroy
	 
	  redirect_to books_path
	end
	 
	private
	  def book_params
	    params.require(:book).permit(:title, :author, :page, :description)
	  end
end
