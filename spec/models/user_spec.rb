require 'spec_helper'

describe User do
  let(:user) { user = User.new(username: "username", email: "unique@unique.com", password: "password" , phase: 3) }

  it { should validate_uniqueness_of(:email) }
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:phase) }

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

  it 'has an array of questions' do
    expect(user.questions).to be_a(Array)
  end

  it 'has an array of comments' do
    expect(user.comments).to be_a(Array)
  end

  it 'has an array of votes' do
    expect(user.votes).to be_a(Array)
  end



end
