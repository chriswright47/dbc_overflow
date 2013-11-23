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

	def edit
		@answer = Answer.find(params[:id])
		@question = @answer.question
	end

	def update
		question = Question.find(params[:question_id])
		answer = Answer.find(params[:id])
		answer.update_attributes(params[:answer])
		redirect_to question_path(question)
	end

	def destroy
		question = Question.find(params[:question_id])
		answer = Answer.find(params[:id])
		answer.destroy
		redirect_to question_path(question)
	end

	def upvote
		answer = Answer.find(params[:id])
		answer.votes.create(user_id: current_user.id, value: 1)
		# answer.votes.create(user_id: current_user.id)
		redirect_to question_path(answer.question)
	end

	def downvote
		answer = Answer.find(params[:id])
		answer.votes.create(user_id: current_user.id, value: -1)
		redirect_to question_path(answer.question)
	end
end