class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines do |t|
    	t.belongs_to :prescription
      t.text :name
      t.text :morning
    	t.text :morning_time
    	t.text :afternoon
    	t.text :afternoon_time
    	t.text :night
    	t.text :night_time
    	t.text :status
      t.timestamps
    end
  end
end
