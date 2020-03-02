class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flashcard_users
  has_many :flashcards, through: :flashcard_users
  has_many :blacklist_users
  has_many :blacklists, through: :blacklist_users
  has_one_attached :photo
  belongs_to :plan

  LEARNING_OPTIONS = [
    "Le Wagon",
    "Duo Lingo",
    "Elevate"
  ]
end
