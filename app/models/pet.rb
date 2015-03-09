class Pet < ActiveRecord::Base
	belongs_to :shelter
	attr_accessor :zip

end
