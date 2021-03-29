require 'rails_helper'

RSpec.describe Bible, type: :model do

  before do
    @bible = Bible.new(
      title: "御言葉",
      subtitle: "御言葉サブタイトル",
      text: "御言葉のの本文--------------------"
    )
  end

  it 'タイトルとサブタイトルと本文があれば有効な状態であること' do
    expect(@bible).to be_valid
  end

  it "タイトルが３１文字以上の場合は登録できない" do
    bible = Bible.new(title: "a" * 31)
    expect(bible).to be_invalid
  end

  it "サブタイトルが５０文字以上の場合は登録できない" do
    bible = Bible.new(subtitle: "a" * 51)
    expect(bible).to be_invalid
  end

  it "本文が空の場合は登録できない" do
    bible = Bible.new(text: "")
    expect(bible).to be_invalid
  end

end
