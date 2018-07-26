class AddExtraFieldsToPrescription < ActiveRecord::Migration[5.1]
  def change
  	add_column :prescriptions, :prescription_num, :string
  	add_column :prescriptions, :no_of_days_medicine_taken, :string
  end
end
