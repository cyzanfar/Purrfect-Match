class AddColumnZipCodeToPets < ActiveRecord::Migration
  def change
    add_column :pets, :zip_code, :string
  end
end
