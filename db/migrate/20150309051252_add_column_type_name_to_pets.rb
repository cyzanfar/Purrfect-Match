class AddColumnTypeNameToPets < ActiveRecord::Migration
  def change
    add_column :pets, :type_name, :string
  end
end
