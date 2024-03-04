
require 'rails_helper'
require 'devise'

RSpec.describe "UsersSessionControllers", type: :request do

  describe "get new_user_session" do
    it "renders the new view" do
      get new_user_session_path
      expect(response).to render_template(:new)
    end
  end

  describe "post user_session" do
    it "creates a new user session" do
      user = FactoryBot.create(:user)
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to redirect_to(root_path) 
    end
  end

  describe "delete user_session" do
    it "deletes user session" do
      user = FactoryBot.create(:user)
      sign_in user
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end  
  end

end
