
require 'rails_helper'
require 'devise'

RSpec.describe "CompaniesControllers", type: :request do

  describe "get companies_path" do
    it "renders the index view" do
      get companies_path
      expect(response).to render_template(:index)
    end
  end

  describe "get company_path" do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      get company_path(id: company.id)
      #puts response.body
      expect(response).to render_template(:show)
    end
  end

describe "get new_company_path" do
    it "renders the :new template" do
    user = FactoryBot.create(:user)
    sign_in user
    get new_company_path
    expect(response).to render_template(:new)
   end
end

describe "get edit_company_path" do
    it "renders the :edit template" do
    user = FactoryBot.create(:user)
    company = FactoryBot.create(:company, user: user)
    sign_in user
    get edit_company_path(id: company.id)
    expect(response).to render_template(:edit)
    end  
  end

describe "post companies_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      user = FactoryBot.create(:user)
      sign_in user
      company_attributes = FactoryBot.attributes_for(:company)
      post companies_path, params: { company: company_attributes }
      expect(response).to redirect_to company_path(id: Company.last.id)
    end
  end

describe "post companies_path with invalid data" do
    it "does not save a new entry or redirect" do
      user = FactoryBot.create(:user)
      sign_in user
      company_attributes = FactoryBot.attributes_for(:company)
      company_attributes.delete(:title)
      expect { post companies_path, params: {company: company_attributes}
    }.to_not change(Company, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put company_path with valid data" do
    it "updates an entry and redirects to the show path for the account" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      sign_in user
      company_attributes = FactoryBot.attributes_for(:company, title: "Updated Title")
      expect { put company_path(id: company.id), params: {company: company_attributes}
    }.to change{ company.reload.title }.to("Updated Title")
      expect(response).to redirect_to company_path(id: company.id)
    end
  end

  describe "put company_path with invalid data" do
    it "does not update the company record or redirect" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      sign_in user
      company_attributes = FactoryBot.attributes_for(:company)
      company_attributes.delete(:title)
      expect { put company_path(id: company.id), params: {company: company_attributes}
    }.to_not change{ company.reload.title }
    expect(response).to redirect_to company_path(id: company.id)
    end  
  end

  describe "delete company record" do
    it "deletes company record" do
      user = FactoryBot.create(:user)
      company = FactoryBot.create(:company, user: user)
      job = FactoryBot.create(:job, company: company)
      sign_in user
      delete destroy_with_jobs_path(id: company.id)
      expect(response).to redirect_to companies_path
    end  
  end
end
