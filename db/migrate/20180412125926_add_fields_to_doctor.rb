class AddFieldsToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :residence_address, :string
    add_column :doctors, :city, :string
    add_column :doctors, :state, :string
    add_column :doctors, :education, :string
    add_column :doctors, :specialist, :string
    add_column :doctors, :gender, :string
    add_column :doctors, :mobile_no, :string
  end
end
