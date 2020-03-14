class Blacklist < ApplicationRecord
  has_many :blacklist_users, dependent: :destroy
  has_many :users, through: :blacklist_users

  def name
    website_name
  end

  def edit
  end

end
