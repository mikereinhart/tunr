class GenresController < ApplicationController
	
	before_filter :ensure_admin, only: [:edit, :new, :destroy]
	#before filter takes one argument, which is the name of a method

	def index
		@genres = Genre.all
	end

	def new
		@genre = Genre.new
	end

	def create
		genre = Genre.new(params[:genre])
		genre.save!
		redirect_to genres_path
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		genre = Genre.find(params[:id])
		genre.update_attributes(params['genre'])
		redirect_to genres_path
	end

	def show
		@genre = Genre.find(params[:id])
	end

	def destroy
			genre = Genre.find(params[:id])
			genre.destroy
			redirect_to :back
	end

	private

	def ensure_admin
		puts 'enter ensure'
		puts current_user && current_user.admin?
		unless current_user && current_user.admin?
			render text: 'not authorized'
		end
	end
end