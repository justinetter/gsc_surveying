class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :password, :string
    add_column :users, :password_salt, :binary
  end
end
