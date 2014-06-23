class ArticlesController < ApplicationController

	def index
		@articles = Article.order("released_at DESC")		
	end 

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end 

	def create
		@article = Article.new(params[:article])
		if @article.save
			redirect_to articles_path, notice: "saved"
		else
			render "new"
		end 
	end 


end
