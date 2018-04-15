class AddExtraFieldsInDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :skills, :string
    add_column :doctors, :thoughts, :string
  end
end
