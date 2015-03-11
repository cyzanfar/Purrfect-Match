class PetsController < ApplicationController

  # PETFINDER = Petfinder::Client.new('bf43919be64d0ffed94aa9fa2acfd9d0', '11f2621e8fac20123e25a1807f0e61fe')

  def index #index page will render search form
    @pet = Pet.new
    #send form data in params to create
  end


  def search
    @pets = Pet.where(clean_params)
    render :results
  end

  private

  def thinned_params
    params["pets"].delete_if {|k, v| v.empty?}
  end

  def clean_params
    thinned_params.permit(:species, :zip_code, :sex, :size, :breed, :age)
  end

end
