
require 'rails_helper'
require 'devise'

RSpec.describe "AccountsControllers", type: :request do

  describe "get accounts_path" do
    it "renders the index view" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:account)
      sign_in user
      get accounts_path
      expect(response).to render_template(:index)
    end
  end

  describe "get account_path" do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      sign_in user
      get account_path(id: account.id)
      #puts response.body
      expect(response).to render_template(:show)
    end
  end

describe "get new_account_path" do
    it "renders the :new template" do
    user = FactoryBot.create(:user)
    sign_in user
    get new_account_path
    expect(response).to render_template(:new)
   end
end

describe "get edit_account_path" do
    it "renders the :edit template" do
    user = FactoryBot.create(:user)
    account = FactoryBot.create(:account, user: user)
    sign_in user
    get edit_account_path(id: account.id)
    expect(response).to render_template(:edit)
    end  
  end

describe "post accounts_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      user = FactoryBot.create(:user)
      sign_in user
      account_attributes = FactoryBot.attributes_for(:account)
      post accounts_path, params: { account: account_attributes }
      expect(response).to redirect_to account_path(id: Account.last.id)
    end
  end

describe "post accounts_path with invalid data" do
    it "does not save a new entry or redirect" do
      user = FactoryBot.create(:user)
      sign_in user
      account_attributes = FactoryBot.attributes_for(:account)
      account_attributes.delete(:first_name)
      expect { post accounts_path, params: {account: account_attributes}
    }.to_not change(Account, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "put account_path with valid data" do
    it "updates an entry and redirects to the show path for the account" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      sign_in user
      account_attributes = FactoryBot.attributes_for(:account, first_name: "Updated Name")
      expect { put account_path(id: account.id), params: {account: account_attributes}
    }.to change{ account.reload.first_name }.to("Updated Name")
      expect(response).to redirect_to account_path(id: account.id)
    end
  end

  describe "put account_path with invalid data" do
    it "does not update the account record or redirect" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      sign_in user
      account_attributes = FactoryBot.attributes_for(:account)
      account_attributes.delete(:first_name)
      expect { put account_path(id: account.id), params: {account: account_attributes}
    }.to_not change{ account.reload.first_name }
    expect(response).to redirect_to account_path(id: account.id)
    end  
  end

  describe "delete account record" do
    it "deletes account record" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      sign_in user
      delete destroy_with_applications_path(id: account.id)
      expect(response).to redirect_to accounts_path
    end  
  end
end
