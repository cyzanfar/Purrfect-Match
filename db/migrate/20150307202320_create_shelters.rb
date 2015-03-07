class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.string :zip
    end
  end
end
