require 'httparty'
require 'json'

class AnimeController < ApplicationController
	def get_user
		user = User.find_by(username: params[:user])
		if user && user.authenticate(params[:password]) 
			response = { :isUser => 1, :userID => user.id }
		else
			response = { :isUser => 0}
		end	

		render json: response
	end 


	def getanime
		mal_id = params[:anime]
		current_user = User.find(params[:userID])
		response = HTTParty.get("https://api.jikan.moe/v3/anime/#{mal_id}", format: :json)
		status = { :notice => "Added to List", :statusColor => "green" }

		if response.length === 0
			status = { :notice => "Something wrong with API query. We could not get requested resource.", :statusColor => "red" }
      		render json: status
    	else
    		anime = Anime.find_by(mal_id: mal_id)
    		if anime === nil
    			anime = Anime.new(mal_id: response['mal_id'], title: response['title'], image: response['image_url'], description: response['synopsis'], rating: response['score'])
    			anime.save ? current_user.animes << anime : status = { :notice => "We couldn't save that", :statusColor => "red" }
	      		render json: status
	      	else
	      		current_user.animes.exists?(mal_id: mal_id) ? status = { :notice => "Already added to list", :statusColor => "yellow" } : current_user.animes << anime
	      		render json: status		
      		end 
    	end
	end

	def destroy
		session[:user_id] = nil
	end
end 