class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :shelters, through: :pets
  has_many :favorite_pets
  has_many :pets, through: :favorite_pets
  #has_many :favoritepets

end

