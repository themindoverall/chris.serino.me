class PagesController < ApplicationController
	def nav_name
		action_name.to_sym
	end

	def bio
		render 'bio'
	end

	def contact
		render 'contact'
	end
end