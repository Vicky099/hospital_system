class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
    	t.belongs_to :patient
    	t.string :recheck_date
    	t.string :doctor_bill_amount
      t.timestamps
    end
  end
end

