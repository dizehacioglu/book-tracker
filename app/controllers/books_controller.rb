class BooksController < ApplicationController

	def index
	end

	def new
	end

	def create
		# @book 

		# render plain: params[:book].inspect
		redirect_to books_path
	end
end
