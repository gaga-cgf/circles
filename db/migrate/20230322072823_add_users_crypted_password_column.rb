class AddUsersCryptedPasswordColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :crypted_password, :string, null: false
    add_column :users, :salt, :string, null: false
    
    remove_column :users, :password, :string
  end
end
