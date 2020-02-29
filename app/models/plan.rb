class Plan < ApplicationRecord
  has_many :users
  monetize :price_cents
end
