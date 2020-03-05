class FlashcardsController < ApplicationController

  def show
    @user = current_user
    @flashcard = Flashcard.find(params[:id])
  end
end
