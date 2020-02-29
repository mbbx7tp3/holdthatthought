class AddImageUrltoBlacklists < ActiveRecord::Migration[5.2]
  def change
    add_column :blacklists, :image_url, :string
  end
end
