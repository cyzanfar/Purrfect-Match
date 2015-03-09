class AddColumnShelterCodeToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :code, :string
  end
end
