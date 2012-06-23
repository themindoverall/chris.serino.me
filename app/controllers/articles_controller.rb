class ArticlesController < ApplicationController
	before_filter :initialize_categories
	def index
		@articles = Article.all.order_by([:created_at, :desc])
	end

	def show
		@article = Article.get(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.get(params[:id])
	end

	def create
		@article = Article.new(params[:article].slice(:title, :summary, :body))
		if check_password(params[:article][:password]) and @article.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def update
		@article = Article.get(params[:id])
		if check_password(params[:article][:password]) and @article.update_attributes(params[:article].slice(:title, :summary, :body))
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	end

	def nav_name
		:blog
	end

	private

	def initialize_categories
		@categories = ['all', 'personal', 'webdev', 'gamedev']
		@category = params[:category] || 'all'
	end
end