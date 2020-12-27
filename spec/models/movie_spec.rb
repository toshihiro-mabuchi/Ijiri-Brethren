require 'rails_helper'

RSpec.describe Movie, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it '動画タイトルと動画URLがあれば有効な状態であること' do
    movie = Movie.new(
        title: "aaa",
        youtube_mid: "fEvM-OUbaKs",
        youtube_url: "https://youtu.be/fEvM-OUbaKs",
        author_name: "kobayashi"
      )
    expect(movie).to be_valid
  end

  it '動画URLがあれば有効な状態であること'
  #   expect().to be_valid
  # end

end
