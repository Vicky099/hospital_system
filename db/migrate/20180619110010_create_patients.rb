class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
    	t.belongs_to :doctor, index: true
    	t.belongs_to :hospital, index: true
    	t.string :first_name
    	t.string :last_name
    	t.text :address
    	t.string :contact_num
    	t.string :gender
    	t.string :date_of_birth
    	t.string :age
    	t.string :pulse
    	t.string :bp
    	t.text :gen_obs
    	t.text :major_obs
    	t.text :disease_found
    	t.text :appointment_status
    	t.text :status
      t.timestamps
    end
  end
end
