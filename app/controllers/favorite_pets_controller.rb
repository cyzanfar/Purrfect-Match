class FavoritePetsController < ApplicationController

	def index
		@favorite_pets = FavoritePet.all
	end

	def show

	end

	def create
		@favorite_pet = FavoritePet.find_or_create_by(pet_id: params["pet"]["id"].to_i, user_id: current_user.id)
		# redirect_to user_path
	end

	def destroy

	end


end
