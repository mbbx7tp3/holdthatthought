class Api::V1::FlashcardsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_flashcard, only: [ :show, :update ]

  def index
    @flashcards = policy_scope(Flashcard)
    authorize @flashcards

    # This is hard coded!!!

    # user = User.last

    # flashcard_users = user.flashcard_users
    # not_completed = flashcard_users.where(status: false)
    # @flashcards = not_completed.map do |flashcard_user|
    #   flashcard_user.flashcard
    # end

    # @flashcards = @flashcards.shuffle.first(3)
  end

  def show
  end

  def update
    @flashcard_user = FlashcardUser.find_by(user_id: current_user.id, flashcard_id: @flashcard.id)
    @flashcard_user.status = true
    render :show
  end

  private

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
    authorize @flashcard
  end

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer, :status)
  end
end
