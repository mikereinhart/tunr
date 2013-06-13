class ArtistsController < ApplicationController
	
	before_filter :ensure_admin, only: [:edit, :new, :destroy]
	#before filter takes one argument, which is the name of a method

	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create
		artist = Artist.new(params[:artist])
		artist.save!
		redirect_to artists_path
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		artist = Artist.find(params[:id])
		artist.update_attributes(params['artist'])
		redirect_to artists_path
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def destroy
			artist = Artist.find(params[:id])
			artist.destroy
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