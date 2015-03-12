class FavoritePetsController < ApplicationController

	def index
		@favorite_pets = FavoritePet.all
	end

	def show

	end

	def create
		@favorite_pet = FavoritePet.create(pet_id: params["pet"]["id"].to_i, user_id: current_user.id)
		redirect_to favorite_pets_path
	end

	def destroy

	end


end
