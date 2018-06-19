class RenameFieldInHospital < ActiveRecord::Migration[5.1]
  def change
  	rename_column :hospitals, :type, :type_of_hospital
  end
end
