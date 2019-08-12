class QuestionsController < ApplicationController
  before_action :authorize

  def index
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new

  end

  def create
  @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question added to database"
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
  @question = Question.find(params[:id])
  render :show
  end

  def update
    @question = Question.find(params[:id])
    @current_user = User.find(session[:user_id])
    @answer = Answer.find(params[:answer_id])
    @answer.users.push(@current_user)
    @answer.save
    redirect_to question_path(@question)
  end


  private

  def question_params
      params.require(:question).permit(:author, :header, :body)
  end
end
