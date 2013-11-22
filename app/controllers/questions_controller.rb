class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answers = @question.answers
  end

  def new
    @question = Question.new
    unless signed_in?
      redirect_to questions_path
    end
  end

  def create
    question = Question.new(params[:question])
    current_user.questions << question
    redirect_to question
  end

  def edit
    @question = Question.find(params[:id])
    if current_user != @question.user
      redirect_to question_path(@question)
    end
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(params[:question])
    redirect_to question_path(question)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to '/'
  end

end
