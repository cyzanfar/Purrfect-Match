class PetsController < ApplicationController
  # before_action :set_pet, only: [:show, :edit, :update, :destroy]
  PETFINDER = Petfinder::Client.new('bf43919be64d0ffed94aa9fa2acfd9d0', '11f2621e8fac20123e25a1807f0e61fe')
  # GET /pets
  # GET /pets.json


  def search
    @pet = Pet.new
  end

  def create

  end



  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params[:pet]
    end
end
