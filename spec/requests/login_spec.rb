require "rails_helper"

RSpec.describe "Logins", type: :request do
  describe "/login/sign_in" do
    it "is not a valid request" do
      post "/login/sign_in", params: { email: "test@example.com" }
      expect(response).to have_http_status(:bad_request)
    end
  end
end
