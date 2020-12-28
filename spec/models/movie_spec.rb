require 'rails_helper'

RSpec.describe Movie, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it 'タイトルと説明文、サムネイル、youtubeID、動画URL、
      動画投稿主、カテゴリーがあれば有効な状態であること' do
    movie = Movie.new(
        title: "aaa",
        text: "こんにちは　こんにちは　こんにちは",
        thumbnail_url: "https://youtu.be/G413S5OqSVA",
        youtube_mid: "fEvM-OUbaKs",
        youtube_url: "https://youtu.be/fEvM-OUbaKs",
        author_name: "kobayashi",
        category: "メンバー"
      )
    expect(movie).to be_valid
  end


end
