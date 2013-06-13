class AddAdminToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean
  	#rails sets a boolean to false as default automatically
  end
end
