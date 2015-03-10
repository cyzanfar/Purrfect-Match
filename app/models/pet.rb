class Pet < ActiveRecord::Base
	attr_accessor :zip
  belongs_to :shelter
  has_many :pet_breeds
  has_many :breeds, through: :pet_breeds
end
