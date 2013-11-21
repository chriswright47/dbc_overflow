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
  end

  def create
    question = Question.new(params[:question])
    user = User.new(username: "test")
    user.password = '1234'
    user.save
    user.questions << question
    # current_user.questions << question
    redirect_to question
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
