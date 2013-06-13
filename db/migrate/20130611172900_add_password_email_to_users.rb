class AddPasswordEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :password_digest, :string
  	#even though the column is called password_digest
  	#here, the column is actually called password
  	#RUBY MAGIC!
  	add_column :users, :email, :string
  end
end
