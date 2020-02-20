class Flashcard < ApplicationRecord
  belongs_to :category
  has_many :flashcard_users
  has_many :users, through: :flashcard_users
end
