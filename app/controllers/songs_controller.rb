class SongsController < ApplicationController
	
	before_filter :ensure_admin, only: [:index, :destroy]
	#before filter takes one argument, which is the name of a method

	def index
		@songs = Song.all
	end

	def new
		@song = Song.new
	end

	def create
		song = Song.new(params[:song])
		song.save!
		redirect_to songs_path
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		song = Song.find(params[:id])
		song.update_attributes(params['song'])
		redirect_to songs_path
	end

	def show
		@song = Song.find(params[:id])
	end

	def destroy
			song = Song.find(params[:id])
			song.destroy
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