require 'spec_helper'

describe Answer do
  let(:answer) { Answer.new(body: "Answer Body")}

  it "can be created" do
    expect(answer).to_not be_nil
  end

  it "has a body" do
    expect(answer.body).to be_a(String)
  end

  it "has a collection of votes" do
    expect(answer.votes).to be_a(Array)
  end

  it "has a vote" do
    answer.votes.new()
    expect(answer.votes.first).to be_an_instance_of(Vote)
  end

  it "has a collection of comments" do
    expect(answer.comments).to be_a(Array)
  end

  it "has a comment" do
    answer.comments.new(body: "Comment Body")
    expect(answer.comments.first).to be_an_instance_of(Comment)
  end

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:question_id) }
  it { should validate_uniqueness_of(:body).scoped_to(:question_id) }

end
