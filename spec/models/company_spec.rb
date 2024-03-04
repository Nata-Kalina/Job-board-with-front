
require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { Company.new(title: "Company1", about: "Great company!", industry: "IT Consulting", website: "company1.com", email: "info@company1.com", phone: "1234567890", linkedin: "https://www.linkedin.com/in/company1", user: FactoryBot.create(:user))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an about" do
    subject.about=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an idustry" do
    subject.industry=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a website" do
    subject.website=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a linkedin profile" do
    subject.linkedin=nil
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
  it "is not valid if the email doesn't have a @" do
    subject.email="natamail.com"
    expect(subject).to_not be_valid
  end

end

