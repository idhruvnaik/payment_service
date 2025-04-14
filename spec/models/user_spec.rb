require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    before(:each) do
      @object = User.new
    end

    it "is valid with valid attributes" do
      @object.password_digest = "1234"
      @object.name = "Dhruv"
      @object.email = "dhruv.naik@fitterfly.com"
      expect(@object).to be_valid
    end

    it "is not to be valid as email is wrong" do
      @object.password_digest = "1234"
      @object.name = "Dhruv"
      @object.email = "dhruv.naik"
      expect(@object).not_to be_valid
    end

    it "validates enum role" do
      expect(User.roles.keys).to include("user", "admin", "superadmin")
    end

  end
end
