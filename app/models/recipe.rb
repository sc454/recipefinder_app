require 'httparty'

class Recipe
	include HTTParty
	key_value = ENV["FOOD2FORK_KEY"] || 'c50f3205ca8691c0e37cf98c273048a3' 
	hostport =  ENV["FOOD2FORK_SERVER_AND_PORT"] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: key_value
	format :json

	def self.for keyword
		get("/search", query: { q: keyword})["recipes"]
	end
end