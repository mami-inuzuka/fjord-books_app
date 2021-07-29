class AddDetialsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :zipcode, :varchar, :limit => 7
    add_column :users, :address, :string
    add_column :users, :bio, :string
  end
end
