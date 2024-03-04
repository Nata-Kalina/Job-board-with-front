
require 'rails_helper'

RSpec.describe Job, type: :model do
  subject { Job.new(title: "Software Developer", description: "Very nice job", application_deadline: "04/01/2024", requirements: "Huge requirements", responsibilities: "Huge responsibilities", salary: "100000", company: FactoryBot.create(:company))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an application deadline" do
    subject.application_deadline=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a requirements" do
    subject.requirements=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a responsibilities" do
    subject.responsibilities=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a salary" do
    subject.salary=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if salary contains letters" do
    subject.salary="10000A"
    expect(subject).to_not be_valid
  end
  it "is not valid if salary contains special characters" do
    subject.salary="10000@"
    expect(subject).to_not be_valid
  end
  it "is not valid if salary is less than 0" do
    subject.salary="-1"
    expect(subject).to_not be_valid
  end

end

