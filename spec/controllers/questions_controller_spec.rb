require 'spec_helper'

describe QuestionsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    ApplicationController.any_instance.should_receive(:signed_in?).any_number_of_times.and_return(true)
    @question = FactoryGirl.create(:question, user_id: @user.id)
    @answer = FactoryGirl.create(:answer, question_id: @question.id, user_id: @user.id)
  end
  describe "GET index" do
    it "assigns @questions" do
      get :index
      expect(assigns(:questions)).to eq([@question])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show/:id" do
    it "assigns @question" do
      get :show, id: @question.id
      expect(assigns(:question)).to eq(@question)
    end

    it "assigns @user" do
      get :show, id: @question.id
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns @answer" do
      get :show, id: @question.id
      expect(assigns(:answers)).to eq([@answer])
    end

    it "renders the show template" do
      get :show, id: @question.id
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns @question" do
      get :new
      expect(assigns(:question).attributes).to eql(Question.new.attributes)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  # describe "POST create" do
  #   it "assigns @question" do
  #     expect do
  #      post :create, :question => {title: @question.title, body: @question.body, user_id: @user.id}
  #    end.to change{@user.questions.count}.by(1)
  #   end
  # end
end
