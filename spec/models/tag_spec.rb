require 'spec_helper'

describe Tag do 
  let(:tag) { Tag.create(name: "name", description: "awesome") }

  it "has a name" do
    expect(tag.name).to be_a(String)
  end

  it "has a description" do
    expect(tag.description).to be_a(String)
  end

  it "has a collection of questions" do
    expect(tag.questions).to be_a(Array)
  end
end
