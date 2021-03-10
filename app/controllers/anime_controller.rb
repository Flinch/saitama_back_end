require 'httparty'
require 'json'

class AnimeController < ApplicationController
	def getanime
		mal_id = params[:anime]
		response = HTTParty.get("https://api.jikan.moe/v3/anime/#{mal_id}", format: :json)

		if response.code == 200
			anime = Anime.new(title: response['title'], image: response['image_url'], description: response['synopsis'], rating: response['score'])
			anime.save	
		end 

	end
end 