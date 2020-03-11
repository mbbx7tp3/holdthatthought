class FlashcardsController < ApplicationController

  def show
    @user = current_user
    @current_flashcard = Flashcard.find(params[:id])
    @next_flashcard = Flashcard.find(params[:id].to_i + 1)
  end
end
