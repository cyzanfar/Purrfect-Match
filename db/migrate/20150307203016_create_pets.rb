class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :pets
      t.string :type
      t.string :breed
      t.string :name
      t.string :sex
      t.string :age
      t.string :size
      t.string :picture
      t.string :shelter_id
      t.text :description
      t.datetime :last_update
    end
  end
end
