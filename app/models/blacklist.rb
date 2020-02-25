class Blacklist < ApplicationRecord
  has_many :blacklist_users
  has_many :users, through: :blacklist_users

  def name
    website_name
  end

end
