class FlashcardsController < ApplicationController

  def show
    @user = current_user
    @flashcard = Flashcard.find(params[:id])
    @next_flashcard = find_next_flashcard
  end

  private

  def find_next_flashcard
      Flashcard.find(params[:id].to_i + 1)
  end

end
