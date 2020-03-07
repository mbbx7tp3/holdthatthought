class FlashcardUsersController < ApplicationController

  def create
    @flascard_user = FlashcardUser.new(user: current_user, flashcard_id: params[:flashcard_id], completed: true)
    if @flascard_user.save
      redirect_to flashcard_path(find_next_flashcard)
    else
      redirect_to flashcard_path(params[:flashcard_id])
    end
  end

  private

  def find_next_flashcard
      Flashcard.find(params[:flashcard_id].to_i + 1)
  end

end
