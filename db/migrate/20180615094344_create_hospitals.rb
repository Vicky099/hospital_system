class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :registration_num
      t.string :contact_num
      t.string :no_of_beds
      t.text :facilities
      t.string :address
      t.string :landmark
      t.string :type
      t.text :working_hours
      t.belongs_to :doctor, index: :true
      t.timestamps
    end
  end
end
