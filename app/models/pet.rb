class Pet < ActiveRecord::Base
  belongs_to :shelter
  has_many :pet_breeds
  has_many :breeds, through: :pet_breeds
end
