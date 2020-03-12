class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
    else
      @user = User.new
    end
    # @blacklist_user = BlacklistUser.new

    # @blacklist_options = Blacklist.all
  end

  def dashboard
    @user = current_user
    @upcoming_flashcard = FlashcardUser.where(user_id: @user.id).where(completed: false).first.flashcard
  end

  def payment
    @user = current_user
  end

end
