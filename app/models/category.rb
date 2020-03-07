class Category < ApplicationRecord
  has_many :flashcards, -> { order(position: :asc) }
end
