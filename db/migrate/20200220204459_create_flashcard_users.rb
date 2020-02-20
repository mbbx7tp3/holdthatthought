class CreateFlashcardUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :flashcard_users do |t|
      t.references :user, foreign_key: true
      t.references :flashcard, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
