class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flashcard_users
  has_many :flashcards, through: :flashcard_users
  has_many :blacklist_users
  has_many :blacklists, through: :blacklist_users

  LEARNING_OPTIONS = [
    "Le Wagon",
    "Duo Lingo",
    "Elevate"
  ]
end
