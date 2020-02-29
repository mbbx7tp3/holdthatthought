json.array! @flashcards do |flashcard|
  json.extract! flashcard, :question, :answer
end
