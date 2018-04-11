class AddOmniauthFieldsToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :provider, :string
    add_column :doctors, :uid, :string
  end
end
