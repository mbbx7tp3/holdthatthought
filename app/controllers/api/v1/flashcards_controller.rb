class Api::V1::FlashcardsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_flashcard, only: [ :show, :update ]

  def index
    @flashcards = policy_scope(Flashcard)
    authorize @flashcards
    # @blacklists = current_user.blacklists
  end

  def show

  end

  def update
    @flashcard.status = true
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
