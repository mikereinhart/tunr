class SessionsController < ApplicationController

	def new

	end

	def create
		puts params
		user = User.find_by_email(params[:email])
		puts 'located user: ' + user.name
		authenticated_user = user.authenticate(params[:password])
		p authenticated_user
			if authenticated_user
				p "entering authenicated user"
				session[:user_id] = authenticated_user.id
				message = "You are authenticated!"
				render text: message, layout: true
			else
				#message = 'You are not a valid user!'
				#reander text: message
				p "did not enter the if statement - FUCK!"
				redirect_to sessions_new_path
			end
	end

	def destroy 
		session[:user_id] = nil
		p session
		redirect_to sessions_new_path
	end

end