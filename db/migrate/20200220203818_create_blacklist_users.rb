class CreateBlacklistUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklist_users do |t|
      t.references :user, foreign_key: true
      t.references :blacklist, foreign_key: true

      t.timestamps
    end
  end
end
