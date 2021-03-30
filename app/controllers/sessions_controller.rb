class SessionsController < ApplicationController
	def new
	end

	def get_user
		user = User.find_by(username: params[:user])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			response = { :isUser => 1 }
		else
			response = { :isUser => 0}
		end	

		render json: response
	end 

	def create
	end

	def destroy
		session[:user_id] = nil
	end

end