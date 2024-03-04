
require 'rails_helper'
require 'devise'

RSpec.describe "ApplicationsControllers", type: :request do

  describe "get applications_path" do
    it "renders the index view" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      application = FactoryBot.create(:application, account: account)
      sign_in user
      get account_applications_path(account_id: account.id)
      expect(response).to render_template(:index)
    end
  end

  describe "get application_path" do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      application = FactoryBot.create(:application, account: account)
      sign_in user
      get account_application_path(account_id: account.id, id: application.id)
      #puts response.body
      expect(response).to render_template(:show)
    end
  end

  describe "get new_application_path" do
    it "renders the :new template" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      application = FactoryBot.create(:application, account: account, job: job)
      sign_in user
      get new_account_application_path(account_id: account.id, job_id: job.id, id: application.id)
      expect(response).to render_template(:new)
   end
end

describe "get edit_application_path" do
    it "renders the :edit template" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      application = FactoryBot.create(:application, account: account, job: job)
      sign_in user
      get edit_account_application_path(account_id: account.id, job_id: job.id, id: application.id)
      expect(response).to render_template(:edit)
    end  
  end

  describe "post applications_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      application = FactoryBot.create(:application, account: account, job: job)
      sign_in user
      application_attributes = FactoryBot.attributes_for(:application)
      post account_applications_path(account_id: account.id, job_id: job.id), params: { application: application_attributes }
      expect(response).to redirect_to account_application_path(account_id: account.id, id: Application.last.id)
    end
  end

  describe "post applications_path with invalid data" do
    it "does not save a new entry or redirect" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      application = FactoryBot.create(:application, account: account, job: job)
      sign_in user
      application_attributes = FactoryBot.attributes_for(:application)
      application_attributes.delete(:resume)
      expect {post account_applications_path(account_id: account.id, job_id: job.id), params: {application: application_attributes}}.to_not change(Application, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put application_path with valid data" do
    it "updates an entry and redirects to the show path for the application" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      application = FactoryBot.create(:application, account: account)
      sign_in user
      application_attributes = FactoryBot.attributes_for(:application, resume: "updated link")
      expect { put account_application_path(account_id: account.id, id: application.id), params: {application: application_attributes}
    }.to change{ application.reload.resume }.to("updated link")
      expect(response).to redirect_to account_application_path(account_id: account.id, id: application.id)
    end
  end

  describe "put application_path with invalid data" do
    it "does not update the application record or redirect" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      application = FactoryBot.create(:application, account: account)
      sign_in user
      application_attributes = FactoryBot.attributes_for(:application)
      application_attributes.delete(:resume)
      expect { put account_application_path(account_id: account.id, id: application.id), params: {application: application_attributes}
    }.to_not change{ application.reload.resume }
    expect(response).to redirect_to account_application_path(account_id: account.id, id: application.id)
    end  
  end

  describe "delete application record" do
    it "deletes application record" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      application = FactoryBot.create(:application, account: account)
      sign_in user
      delete account_application_path(account_id: account.id, id: application.id)
      expect(response).to redirect_to accounts_path
    end  
  end
end
