require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(email: "test001@test.com", password: "12345678Test!!!")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the email address doesn't have a @" do
    subject.email="natamail.com"
    expect(subject).to_not be_valid
  end

  it "is not valid if the password is weak" do
    subject.password="123test"
    expect(subject).to_not be_valid
  end
  
end

