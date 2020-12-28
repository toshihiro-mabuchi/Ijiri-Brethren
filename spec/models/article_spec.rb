require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @article1 = Article.new(
      issue_date: "#{Date.current}",
      letter: fixture_file_upload('public/test.pdf')
    )

    @article2 = Article.new(
      issue_date: nil,
      letter: fixture_file_upload('public/test.pdf')
    )

    @article3 = Article.new(
      issue_date: "#{Date.current}",
      letter: nil
    )

    @article4 = Article.new(
      issue_date: "#{Date.current}",
      letter: fixture_file_upload('public/test.jpg')
    )

    @article5 = Article.new(
      issue_date: "#{Date.current}",
      letter: fixture_file_upload('public/test_large.pdf')
    )
  end

  it '発効日とPDFファイルがあれば有効な状態であること' do
    expect(@article1).to be_valid
  end
  
  it 'PDFファイルはあるが発効日が空の場合は無効な状態であること' do
    expect(@article2).to_not be_valid
  end

  it '発効日はあるがPDFファイルが空の場合は無効な状態であること' do
    expect(@article3).to_not be_valid
  end

  it '発効日はあるがファイルがPDFファイル以外場合は無効な状態であること' do
    expect(@article4).to_not be_valid
  end

  it '発効日はあるがファイルサイズが5MB以上の場合は無効な状態であること' do
    expect(@article5).to_not be_valid
  end
end
