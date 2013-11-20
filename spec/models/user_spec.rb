require 'spec_helper'

describe User do
  let(:user) { User.create(username: "username", email: "email@email.com", password: "password", phase: 3) }

  it 'can be created' do
    expect(user).to_not be_nil
  end

  it 'has a username' do
    expect(user.username).to be_a(String)
  end

  it 'has an email' do
    expect(user.email).to be_a(String)
  end

  it 'has a password' do
    expect(user.password).to be_a(String)
  end

  it 'has a phase' do
    expect(user.phase).to be_a(Fixnum)
  end

  it 'has an array of posts' do
    expect(user.posts).to be_a(Array)
  end

  it 'has an array of comments' do
    expect(user.comments).to be_a(Array)
  end

  it 'has an array of votes' do
    expect(user.votes).to be_a(Array)
  end

end