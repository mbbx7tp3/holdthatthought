class FlashcardsController < ApplicationController
  def show
    @user = current_user
    @current_flashcard = FlashcardUser.where(user_id: @user.id).where(completed: false).first.flashcard
    @next_flashcard = Flashcard.find(params[:id].to_i + 1)
  end
end
