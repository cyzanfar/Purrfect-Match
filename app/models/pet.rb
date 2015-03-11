class Pet < ActiveRecord::Base
  belongs_to :shelter
  has_many :pet_breeds
  has_many :breeds, through: :pet_breeds
  has_many :favorite_pets
  has_many :users, through: :favorite_pets


  # def self.species
  #   @species = ["barnyard", "bird", "cat", "dog", "horse", "pig", "reptile", "smallfurry"]
  # end

  def search
    Pet.find(:all, :conditions => conditions)
  end
end

  def species_conditions
    ["pets.species == params['pets']['species']"]

  end

  def zip_conditions
    ["pets.species == params['pets']['species']"]
  end


# def keyword_conditions
#   ["pets.species = params['pets']['species']"] unless keywords.blank?
# end

# def minimum_price_conditions
#   ["products.price >= ?", minimum_price] unless minimum_price.blank?
# end

# def maximum_price_conditions
#   ["products.price <= ?", maximum_price] unless maximum_price.blank?
# end

# def category_conditions
#   ["products.category_id = ?", category_id] unless category_id.blank?
# end

# def conditions
#   [conditions_clauses.join(' AND '), *conditions_options]
# end

# def conditions_clauses
#   conditions_parts.map { |condition| condition.first }
# end

# def conditions_options
#   conditions_parts.map { |condition| condition[1..-1] }.flatten
# end

# def conditions_parts
#   private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
# end
# end
