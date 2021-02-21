require 'rails_helper'

RSpec.describe "AdminPages", type: :request do

  describe "GET #index" do
    it "returns http success" do

      # 管理者ユーザー作成
      @user = User.create(
        id: 1,
        name: "管理者",
        email: "admin@gmail.com",
        password: "Passw0rd",
        password_confirmation: "Passw0rd",
        phone_number: "090-1234-5678",
        member_groups: "グループ１",
        admin: true)

      ### その他の項目も作成する必要あり ###



      get "/admin_pages"
      expect(response).to have_http_status(:success)
    end
  end

end
