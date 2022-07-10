class AddNameAndSurnameToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :name, :string
    add_column :doctors, :surname, :string
  end
end
