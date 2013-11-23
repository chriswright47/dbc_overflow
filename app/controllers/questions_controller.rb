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
    @tags = Tag.all
    unless signed_in?
      redirect_to questions_path
    end
  end

  def create
    tags = params[:question].extract!(:tags)[:tags]

    question = Question.create(params[:question])
    current_user.questions << question

    if !tags.nil?
      tag_ids = tags.select { |tag_id, checked| checked == "1" }.keys

      tag_ids.each do |tag_id|
        question.taggings << Tagging.create(tag_id: tag_id)
      end
    end

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
