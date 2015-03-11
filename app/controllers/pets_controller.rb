class PetsController < ApplicationController

  # PETFINDER = Petfinder::Client.new('bf43919be64d0ffed94aa9fa2acfd9d0', '11f2621e8fac20123e25a1807f0e61fe')

  def index #index page will render search form
    @pet = Pet.new
    #send form data in params to create
  end


  def search
    @pets = Pet.where(clean_params)
    # binding.pry
    render :results
  end

  private

  def thinned_params
    params["pets"].delete_if {|k, v| v.empty?}

  end

  def destroy_shelters
    Shelter.destroy_all
  end

  def results

    @animals = Pet.all
    @animals.collect do |animal|
      animal.shelter_name = Shelter.find_or_create_by(name: PETFINDER.shelter(animal.shelter_id).name, email: PETFINDER.shelter(animal.shelter_id).email, phone: PETFINDER.shelter(animal.shelter_id).phone, city: PETFINDER.shelter(animal.shelter_id).city, zip: PETFINDER.shelter(animal.shelter_id).zip).name
      animal.save
    end
  end

  # def create

  def create
    # binding.pry
    #redirect to results
  end

  #   Pet.destroy_all
  #    @pets = PETFINDER.find_pets(pet_finder_type, pet_finder_zip, count: 500)
  #    if params['pets']['breed'].empty?
  #     @selected_animals = @pets.select do |pet|
  #       pet.age == params['pets']['age']  &&
  #       pet.size == params['pets']['size'] &&
  #       pet.sex == params['pets']['sex']
  #     end
  #   else
  #     @selected_animals = @pets.select do |pet|
  #       pet.age == params['pets']['age']  &&
  #       pet.size == params['pets']['size'] &&
  #       pet.sex == params['pets']['sex'] &&
  #       pet.breeds.include?(params['pets']['breeds'])
  #     end
  #   end


  def clean_params
    # binding.pry
    thinned_params.permit(:species, :zip_code, :sex, :size, :breed, :age)
  end


end
