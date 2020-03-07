class Api::V1::FlashcardsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_flashcard, only: [ :show, :update ]

  def index
    @flashcards = policy_scope(Flashcard)
    authorize @flashcards

    user_email = request.env["HTTP_X_USER_EMAIL"]
    user = User.find_by(email: user_email)

    flashcard_users = user.flashcard_users
    not_completed = flashcard_users.where(completed: false)
    @flashcards = not_completed.map do |flashcard_user|
      flashcard_user.flashcard
    end

    @flashcards = @flashcards.shuffle.first(3)
  end

  def show
  end

  def update
    # binding.pry
    user_email = request.env["HTTP_X_USER_EMAIL"]
    user = User.find_by(email: user_email)

    @flashcard_user = FlashcardUser.find_by(user_id: user.id, flashcard_id: @flashcard.id)
    @flashcard_user.completed = true
    render :show
  end

  private

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
    authorize @flashcard
  end

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer, :completed)
  end
end
