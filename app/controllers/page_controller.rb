require 'net/http'
require 'json'

class PageController < ApplicationController
  def home
  	if params[:user] != nil
		user = params[:user]
		url = URI('https://api.github.com/search/users?q=' + user)
		req = Net::HTTP.get(url)

		@data = JSON.parse(req)
		urlrepos = URI('https://api.github.com/users/' + user +'/repos')
		requete = Net::HTTP.get(urlrepos)

		@repos = JSON.parse(requete)

		urllangue = URI('https://api.github.com/repos/' + user + '/' + @repos[0]['name'] + '/languages')
		reqLangue = Net::HTTP.get(urllangue)
		@langues = JSON.parse(reqLangue)

 
  end
end
end