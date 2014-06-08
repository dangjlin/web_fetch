class LookupController < ApplicationController


	def index 
		@lookup_items = Patent.all 
	end 

	def new

		@lookup_item = Patent.new
	end

	def create
	end

	def show

		@lookup_item = Patent.find(params[:id])

	end

	def edit
	end 

	def update
	end

	def delete
	end


end
