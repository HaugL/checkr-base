require 'rails_helper'
require "spec_helper"


RSpec.describe UsersController, type: :controller do
  render_views
  # let(:json) { JSON.parse(response.body) }

  before(:all) do
    @user1 = create(:user)
    @user2 = create(:user, email: "test2@test.com")
    @user3 = create(:user, email: "test3@test.com")
  end

  describe "index" do
    it "renders first page" do
       get :index, :params => {:page => 1}

       expect(response.body).to include_json(
        [
          { id: @user1.id, email: "test@test.com" },
          { id: @user2.id, email: "test2@test.com" }
        ]
      )
    end

    it "renders second page" do
       get :index, :params => {:page => 2}
       expect(response.body).to include_json(
        [
          { id: @user3.id, email: "test3@test.com" },
        ]
      )
    end

    it "renders first page when given 0" do
      get :index, :params => {:page => 0}
      expect(response.body).to include_json(
       [
         { id: @user1.id, email: "test@test.com" },
         { id: @user2.id, email: "test2@test.com" }
       ]
     )
    end

    it "renders nothing when the page is beyond data" do
     get :index, :params => {:page => 100}
     expect(response.body).to eq("[]")
    end
 end

end
