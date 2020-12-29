require 'rails_helper'

RSpec.describe "MemberPages", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/member_page/index"
      expect(response).to have_http_status(:success)
    end
  end

end
