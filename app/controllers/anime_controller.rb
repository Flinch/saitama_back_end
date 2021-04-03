require 'httparty'
require 'json'

class AnimeController < ApplicationController
	def get_user
		user = User.find_by(username: params[:user])
		if user && user.authenticate(params[:password]) 
			response = { :isUser => 1, :userID => user.id, :username => user.username }
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
			anime = Anime.new(mal_id: response['mal_id'], title: response['title'], image: response['image_url'], description: response['synopsis'], rating: response['score'])

			if anime.save
				current_user.animes << anime
			else
				if current_user.animes.find_by(mal_id: anime[:mal_id])
					status = { :notice => anime.errors.full_messages, :statusColor => "yellow" }
				else
					anime = Anime.find_by(mal_id: mal_id)
					current_user.animes << anime 
      			end
      		end
      		render json: status
    	end
	end

	def getUserAnime
		current_user = User.find(params[:userID])
		user_anime = current_user.animes.all
		render json: user_anime
	end

	def userSignup
		user = User.new(username: params[:username], password: params[:password], email: params[:email])
		if !user.save
			response = {:status => 0, :message => user.errors.full_messages}
			render json: response
		else
			response = {:status => 1, :message => 'success!', :userID => user.id}
			render json: response
		end
	end


end 