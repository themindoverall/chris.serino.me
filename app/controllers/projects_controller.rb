class ProjectsController < ApplicationController
	before_filter :initialize_categories
	def index
		@projects = Project.all.order_by([:created_at, :desc])
	end

	def show
		@project = Project.get(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.get(params[:id])
	end

	def create
		@project = Project.new(params[:project].slice(:title, :summary, :body))
		if @project.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def update
		@project = Project.get(params[:id])
		if @project.update_attributes(params[:project].slice(:title, :summary, :body))
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
	end

	def nav_name
		:work
	end

	private

	def initialize_categories
		@categories = ['all', 'personal', 'webdev', 'gamedev']
		@category = params[:category] || 'all'
	end
end