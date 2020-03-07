class AddPositionToFlashcards < ActiveRecord::Migration[5.2]
  def change
    add_column :flashcards, :position, :integer
  end
end
