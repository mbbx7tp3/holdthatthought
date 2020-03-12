json.array! @flashcards do |flashcard|
  json.extract! flashcard, :id, :question, :answer
end
