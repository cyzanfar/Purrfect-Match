class UsersController < ApplicationController

  before_action :login_required, :my_pets
  
  def index
  end

  def show

  end

  def my_pets
    @user = User.find_by(current_user.id)
    @pets = @user.pets

    render :my_pets
  end
end