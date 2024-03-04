
require 'rails_helper'
require 'devise'

RSpec.describe "JobsControllers", type: :request do

  describe "get jobs_path" do
    it "renders the index view" do
      get jobs_path
      expect(response).to render_template(:index)
    end
  end

  describe "get job_path" do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      get job_path(id: job.id)
      #puts response.body
      expect(response).to render_template(:show)
    end
  end

  describe "get job_path" do
    it "renders the :new template" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      get new_company_job_path(company_id: company.id, id: job.id)
      expect(response).to render_template(:new)
   end
end

describe "get edit_job_path" do
    it "renders the :edit template" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      get edit_company_job_path(company_id: company.id, id: job.id)
      expect(response).to render_template(:edit)
    end  
  end

  describe "post jobs_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      job_attributes = FactoryBot.attributes_for(:job)
      post company_jobs_path(company_id: company.id), params: { job: job_attributes }
      expect(response).to redirect_to job_path(id: Job.last.id)
    end
  end

  describe "post jobs_path with invalid data" do
    it "does not save a new entry or redirect" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      job_attributes = FactoryBot.attributes_for(:job)
      job_attributes.delete(:title)
      expect {post company_jobs_path(company_id: company.id), params: {job: job_attributes}}.to_not change(Job, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put job_path with valid data" do
    it "updates an entry and redirects to the show path for the job" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      job_attributes = FactoryBot.attributes_for(:application, title: "Updated Title")
      expect { put company_job_path(company_id: company.id, id: job.id), params: {job: job_attributes}
    }.to change{ job.reload.title }.to("Updated Title")
      expect(response).to redirect_to job_path(id: job.id)
    end
  end

  describe "put job_path with invalid data" do
    it "does not update the application record or redirect" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      job_attributes = FactoryBot.attributes_for(:job)
      job_attributes.delete(:title)
      expect { put company_job_path(company_id: company.id, id: job.id), params: {job: job_attributes}
    }.to_not change{ job.reload.title }
    expect(response).to redirect_to job_path(id: job.id)
    end  
  end

  describe "delete job record" do
    it "deletes job record" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      delete company_job_path(company_id: company.id, id: job.id)
      expect(response).to redirect_to jobs_path
    end  
  end
end
