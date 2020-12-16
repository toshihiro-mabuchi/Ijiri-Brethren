require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  ### 名前、メール、パスワードがあれば有効な状態であること ###
  it '名前、メール、パスワードがあれば有効な状態であること' do
    user = User.new(
      name: 'test',
      email: 'test@example.com',
      password: 'foobar12A',
      password_confirmation: 'foobar12A'
    )
    expect(user).to be_valid
  end

  ### 上記と同様の処理を別の記載方法で書いた場合 ###
  # before do
  #   @user = User.new(
  #     name: "test",
  #     email:"test@example.com",
  #     password: "foobar12A",
  #     password_confirmation: "foobar12A"
  #   )
  # end
  # subject { @user }
  # it { should respond_to(:name) }
  # it { should respond_to(:email) }
  # # it { should respond_to(:password_digest) }
  # it { should respond_to(:password) }
  # it { should respond_to(:password_confirmation) }
  # it { should be_valid }

  ### パスワードのチェックを個別に書いた場合 ###
  # it 'パスワードに英小文字が含まれない場合無効な状態であること' do
  #   user = User.new(password: '1'+'A' * 5, password_confirmation: '1'+'A' * 5)
  #   user.valid?
  #   expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  # end

  # it 'パスワードに英大文字が含まれない場合無効な状態であること' do
  #   user = User.new(password: '1'+'a' * 5, password_confirmation: '1'+'a' * 5)
  #   user.valid?
  #   expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  # end

  # it 'パスワードに数字が含まれない場合無効な状態であること' do
  #   user = User.new(password: 'A'+'a' * 5, password_confirmation: 'A'+'a' * 5)
  #   user.valid?
  #   expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  # end

  # it 'パスワードが5文字以下なら無効な状態であること' do
  #   user = User.new(password: '1A'+'a' * 3, password_confirmation: '1A'+'a' * 3)
  #   user.valid?
  #   expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  # end

  # it 'パスワードが13文字以上なら無効な状態であること' do
  #   user = User.new(password: '1A'+'a' * 11, password_confirmation: '1A'+'a' * 11)
  #   user.valid?
  #   expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  # end
  #-------------------------------------------------#

end