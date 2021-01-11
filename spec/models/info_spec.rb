require 'rails_helper'

RSpec.describe Info, type: :model do
  
  before do
    @info_presence = Info.new(
      titke: "お知らせ",
      content: "お知らせの本文--------------------"
    )
  end

  it 'タイトルと本文があれば有効な状態であること' do
    expect(@info).to be_valid
  end

  it "ユーザー名が５１文字以上の場合は登録できない" do
    user = User.new(name: "a" * 51, password: "password")
    expect(user).to be_invalid
  end

end
