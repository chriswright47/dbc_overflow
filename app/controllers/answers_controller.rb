require 'json'
require 'debugger'
class AnswersController < ApplicationController

	def new
		@question = Question.find(params[:question_id])
		# thing = {test: 'testing'}
		respond_to do |format|
			format.js { (render :new, layout: false).to_json }
		end
	end

	def create
		if request.xhr?
			question = Question.find(params[:question_id])
			answer = Answer.new(body: params[:body])
			current_user.answers << answer
			question.answers << answer
			render :partial => 'answer', :locals => {:answer => answer}, layout: false
		else
			question = Question.find(params[:question_id])
			answer = Answer.new(params[:answer])
			current_user.answers << answer
			question.answers << answer
			redirect_to question_path(question)
		end
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