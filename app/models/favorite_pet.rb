class FavoritePet < ActiveRecord::Base
	belongs_to :pet
	belongs_to :user
end
