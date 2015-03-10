class RemovePetsFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :pets, :string
    add_column :pets, :species, :string
  end
end
