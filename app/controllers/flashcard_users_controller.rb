class FlashcardUsersController < ApplicationController

  def create
  @flashcard_user = current_user
  @flashcard = Flashcard.find(params[:id])
  end

end
