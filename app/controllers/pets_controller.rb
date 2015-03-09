class PetsController < ApplicationController

  # before_action :set_pet, only: [:show, :edit, :update, :destroy]
  PETFINDER = Petfinder::Client.new('bf43919be64d0ffed94aa9fa2acfd9d0', '11f2621e8fac20123e25a1807f0e61fe')
  # GET /pets
  # GET /pets.json


  def search
    @pet = Pet.new
  end

  def results
    Shelter.destroy_all
    @animals = Pet.all
    @animals.collect do |animal|
      animal.shelter_name = Shelter.find_or_create_by(name: PETFINDER.shelter(animal.shelter_id).name, email: PETFINDER.shelter(animal.shelter_id).email, phone: PETFINDER.shelter(animal.shelter_id).phone, city: PETFINDER.shelter(animal.shelter_id).city, zip: PETFINDER.shelter(animal.shelter_id).zip).name

      animal.save
    end
     # binding.pry
  end

  def create
    Pet.destroy_all
     @pets = PETFINDER.find_pets(pet_finder_type, pet_finder_zip, count: 500)
     if params['pets']['breed'].empty?
      @selected_animals = @pets.select do |pet|
        pet.age == params['pets']['age']  &&
        pet.size == params['pets']['size'] &&
        pet.sex == params['pets']['sex']
      end
    else
      @selected_animals = @pets.select do |pet|
        pet.age == params['pets']['age']  &&
        pet.size == params['pets']['size'] &&
        pet.sex == params['pets']['sex'] &&
        pet.breeds.include?(params['pets']['breeds'])
      end
    end
      @selected_animals.each do |selected_animal|
        @desired_pet = Pet.create(name: selected_animal.name)
        @desired_pet.age = selected_animal.age
        @desired_pet.size = selected_animal.size
        @desired_pet.sex = selected_animal.sex
        @desired_pet.breed = selected_animal.breeds.join
        @desired_pet.picture = selected_animal.photos.first.medium
        @desired_pet.description = selected_animal.description
        @desired_pet.shelter_id = selected_animal.shelter_id
        @desired_pet.last_update = selected_animal.last_update
        @desired_pet.save
      end
      # binding.pry
      redirect_to :controller=>'pets', :action => 'results'
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
