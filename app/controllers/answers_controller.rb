class AnswersController < ApplicationController 

	def new
		@question = Question.find(params[:question_id])
	end

	def create
		question = Question.find(params[:question_id]) 
		answer = Answer.new(params[:answer])
		current_user.answers << answer 
		question.answers << answer 
		redirect_to question_path(question)
	end
end