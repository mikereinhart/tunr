class UsersController < ApplicationController
	
	before_filter :ensure_admin, only: [:index, :destroy]
	#before filter takes one argument, which is the name of a method

	def index
		puts 'enter index'
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(params[:user])
		user.save!
		render nothing: true
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update_attributes(params['user'])
		redirect_to root_path
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
			user = User.find(params[:id])
			user.destroy
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