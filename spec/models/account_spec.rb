
require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { Account.new(first_name: "Anna", last_name: "White", phone: "8889995678", user: FactoryBot.create(:user))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the first name contains number" do
    subject.first_name="Anna1"
    expect(subject).to_not be_valid
  end
  it "is not valid if the last name contains number" do
    subject.last_name="White1"
    expect(subject).to_not be_valid
  end
  it "is not valid if the first name contains less than 2 characters" do
    subject.first_name="A"
    expect(subject).to_not be_valid
  end
  it "is not valid if the last name contains less than 2 characters" do
    subject.last_name="A"
    expect(subject).to_not be_valid
  end
  it "is not valid if the first name contains more than 255 characters" do
    subject.first_name="A*266"
    expect(subject).to_not be_valid
  end
  it "is not valid if the last name contains more than 255 characters" do
    subject.last_name="A*266"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
    subject.phone="123456789"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
    subject.phone="12345678910"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not all digits" do
    subject.phone="123456789q"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not all digits" do
    subject.phone="123456789-"
    expect(subject).to_not be_valid
  end
  
end

