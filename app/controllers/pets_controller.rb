class PetsController < ApplicationController

  # before_action :set_pet, only: [:show, :edit, :update, :destroy]
  PETFINDER = Petfinder::Client.new('bf43919be64d0ffed94aa9fa2acfd9d0', '11f2621e8fac20123e25a1807f0e61fe')
  # GET /pets
  # GET /pets.json


  def search
    @pet = Pet.new
  end

  def create
     @pets = PETFINDER.find_pets(pet_finder_type, pet_finder_zip, count: 500)
      @selected_animals = @pets.select do |pet|
        pet.age == params['pets']['age']
      end

      @selected_animals.each do |selected_animal|
        hello = Pet.create(name: selected_animal.name, age: selected_animal.age, size: selected_animal.size, sex: selected_animal.sex, breed: selected_animal.breeds)
         binding.pry
      end

      # binding.pry


  end



  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_finder_type
      params[:pets][:type]

    end

    def pet_finder_zip
      params[:pets][:zip]

    end
end
