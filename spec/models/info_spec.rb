require 'rails_helper'

RSpec.describe Info, type: :model do
  
  before do
    @info_presence = Info.new(
      title: "お知らせ",
      content: "お知らせの本文--------------------"
    )
  end

  it 'タイトルと本文があれば有効な状態であること' do
    expect(@info_presence).to be_valid
  end

  it "タイトルが５１文字以上の場合は登録できない" do
    info = Info.new(title: "a" * 51)
    expect(info).to be_invalid
  end

  it "本文が５００文字以上の場合は登録できない" do
    info = Info.new(content: "a" * 500)
    expect(info).to be_invalid
  end

end
