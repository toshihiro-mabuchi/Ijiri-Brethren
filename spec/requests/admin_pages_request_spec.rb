require 'rails_helper'

RSpec.describe "AdminPages", type: :request do

  describe "GET /admin_pages" do
    it "returns http success" do
      get admin_pages_path
      expect(response).to have_http_status(:success)
    end
  end

end
