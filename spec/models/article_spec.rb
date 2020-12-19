require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @article1 = Article.new(
      issue_date: "#{Date.current}"
    )
    @article2 = Article.new(
      issue_date: nil
    )
  end

  it '発効日があれば有効な状態であること' do
    expect(@article1).to be_valid
  end
  
  it '発効日が空であれば無効な状態であること' do
    expect(@article2).to_not be_valid
  end
end
