require 'spec_helper'

describe Comment do
  let(:comment) { Comment.create(body: "comment body") }
  describe "all comments regardless of commentable type" do

    it "has a body" do
      expect(comment.body).to be_a(String)
    end

    it "has a user" do
      comment.create_user
      expect(comment.user).to be_an_instance_of(User)
    end
  end

  describe "a comment with a question type" do 
    let(:question) { Question.create }

    it "has a question" do
      question.comments << comment
      expect(comment.commentable).to be_an_instance_of(Question)
    end
  end

  describe "a comment with an answer type" do 
    let(:answer) { Answer.create }

    it "has an answer" do
      answer.comments << comment
      expect(comment.commentable).to be_an_instance_of(Answer)
    end
  end
end

