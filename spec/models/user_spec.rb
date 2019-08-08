require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model" do
    it "saves with valid name and email" do
      User.create(name: "Name", email: "email@email.com")
      expect(User.all.size).to eq(1)
    end
    
    it "requires name" do
      user = User.create(email: "test@test.com")
      expect(user.errors["name"][0]).to eq("users must have a name")
    end

    it "requires an email" do
      user = User.create(name: "Name")
      expect(user.errors["email"]).to include("users must have an email")
    end

    it "requires valid email formats" do
      user = User.create(name: "Name", email: "not an email")
      expect(user.errors["email"]).to include("email has an invalid format")
    end

    it "requires unique email" do
      User.create(name: "Name", email: "email@email.com")
      user = User.create(name: "Name", email: "email@email.com")
      expect(user.errors["email"]).to include("an account with this email already exists")
    end
  end
end
