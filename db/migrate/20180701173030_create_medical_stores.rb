class CreateMedicalStores < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_stores do |t|
    	t.belongs_to :hospital, index: true
    	t.string :owner
    	t.string :name
    	t.text :address
    	t.string :contact_no
    	t.string :status
    	t.string :gst_no
    	t.string :pancard_no
      t.timestamps
    end
  end
end
