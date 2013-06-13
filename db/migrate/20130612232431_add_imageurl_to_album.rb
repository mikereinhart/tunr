class AddImageurlToAlbum < ActiveRecord::Migration
  def change
  	add_column :albums, :img_url, :string
  end
end
