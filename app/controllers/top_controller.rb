class TopController < ApplicationController
	before_filter :current_user
	def index 
		@message = "Hello World"
	end 
end
