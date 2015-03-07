class RemoveColumnPetsFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :pets, :string
  end
end
