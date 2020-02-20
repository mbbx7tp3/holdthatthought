class AddDetailsToBlacklist < ActiveRecord::Migration[5.2]
  def change
    add_column :blacklists, :website_name, :string
    add_column :blacklists, :website_url, :string
    add_column :blacklists, :description, :string
  end
end
