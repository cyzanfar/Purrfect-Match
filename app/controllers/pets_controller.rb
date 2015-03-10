class PetsController < ApplicationController

  PETFINDER = Petfinder::Client.new('bf43919be64d0ffed94aa9fa2acfd9d0', '11f2621e8fac20123e25a1807f0e61fe')

  def search
    @pet = Pet.new
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

  def destroy_pets
    Pet.destroy_all
  end
   t5 = Time.now
   def create
    # binding.pry
    # destroy_pets
     @petfinders = PETFINDER.find_pets(pet_finder_type, pet_finder_zip, clean_params)
      # binding.pry

      # # @petfinders.each do |petfinder|
      # #   PETFINDER.shelter(shelter_id: petfinder.shelter_id).each do |shelter|
      # #     Shelter.find_or_create_by(name: shelter.name, phone: shelter.phone, city: shelter.city, zip: shelter.zip)

      # #   end
      # #   @desired_pet = Pet.find_or_create_by(name: petfinder.name, age: petfinder.age, sex: petfinder.sex, type_name: petfinder.animal, description: petfinder.description, shelter_code: petfinder.shelter_id, shelter_id: shelter.id)
      # end
      @desired_pet.age = petfinder.age
      @desired_pet.size = petfinder.size
      @desired_pet.sex = petfinder.sex
      @desired_pet.breed = petfinder.breeds.join
      @desired_pet.type_name = pet_finder_type
      @desired_pet.picture = petfinder.photos.first.medium if !petfinder.photos.empty?
      # THIS line breaks if there are no medium picture for the animals queried
      @desired_pet.description = petfinder.description
      @desired_pet.shelter_id = petfinder.shelter_id
      @desired_pet.last_update = petfinder.last_update
      @desired_pet.save
      # binding.pry
      redirect_to :controller=>'pets', :action => 'results'
  end
      t6 = Time.now
      timer3 = t6-t5
      binding.pry
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def clean_params
      params['pets']['count'] = 25
      params['pets'].delete_if {|key, value| value == ""}
      # binding.pry
    end

    def pet_finder_type
      params[:pets_search][:type]

    end

    def pet_finder_zip
      params[:pets_search][:zip]

    end
end
