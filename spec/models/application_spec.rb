
require 'rails_helper'

RSpec.describe Application, type: :model do
  subject { Application.new(resume: "https://docs.google.com/document/u/0/", status: "applied", account: FactoryBot.create(:account), job: FactoryBot.create(:job))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a resume" do
    subject.resume=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a status" do
    subject.status=nil
    expect(subject).to_not be_valid
  end

end

