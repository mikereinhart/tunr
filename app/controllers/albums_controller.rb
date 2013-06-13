class AlbumsController < ApplicationController
	
	before_filter :ensure_admin, only: [:index, :destroy]
	#before filter takes one argument, which is the name of a method

	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create
		album = Album.new(params[:album])
		album.save!
		redirect_to albums_path
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		album = Album.find(params[:id])
		album.update_attributes(params['album'])
		redirect_to albums_path
	end

	def show
		@album = Album.find(params[:id])
	end

	def destroy
			album = Album.find(params[:id])
			album.destroy
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