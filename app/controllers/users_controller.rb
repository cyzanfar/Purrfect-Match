class UsersController < ApplicationController

  before_action :login_required, :my_pets
  
  def index
  end

  def show

  end

  def my_pets
    # binding.pry
    @user = User.find(current_user.id)
    @pets = @user.pets

    render :my_pets
  end
end