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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
