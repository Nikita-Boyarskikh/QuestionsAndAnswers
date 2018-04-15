class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :set_question, only: [:show, :edit, :new, :create]

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.author = current_user
    @answer.question = @question

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@question, @answer], notice: t('.SuccessfullyCreated') }
        format.json { render :show, status: :created, location: [@question, @answer] }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(text: 'Some text')
        format.html { redirect_to [@answer.question, @answer], notice: t('.SuccessfullyUpdated') }
        format.json { render :show, status: :ok, location: [@answer.question, @answer] }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text, :question_id, :author_id, :tag_ids)
    end
end
