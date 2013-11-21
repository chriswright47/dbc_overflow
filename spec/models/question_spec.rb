require 'spec_helper'

describe Question do
  let(:question) { Question.create(title: "Question title", body: "Question body") }
  # let(:answer) { question.answers.create(body: "Answer body") }


  it "can be created" do
    expect(question).to_not be_nil
  end

  it "has a title" do
    expect(question.title).to be_a(String)
  end

  it "has a body" do
    expect(question.body).to be_a(String)
  end

  it "has a collection of answers" do
    expect(question.answers).to be_a(Array)
  end

  it "has an answer" do
    question.answers.create(body: "Answer body")
    expect(question.answers.first).to be_an_instance_of(Answer)
  end

  it "has a collection of votes" do
    expect(question.votes).to be_a(Array)
  end

  it "has a vote" do
    question.votes.create()
    expect(question.votes.first).to be_an_instance_of(Vote)
  end

  it "has a collection of comments" do
    expect(question.comments).to be_a(Array)
  end

  it "has a comment" do
    question.comments.create(body: "Comment Body")
    expect(question.comments.first).to be_an_instance_of(Comment)
  end

end
