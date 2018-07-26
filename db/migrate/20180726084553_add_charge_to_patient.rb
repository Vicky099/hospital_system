class AddChargeToPatient < ActiveRecord::Migration[5.1]
  def change
  	add_column :patients, :charge, :integer
  end
end
