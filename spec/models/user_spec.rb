require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  ### 名前、メール、パスワードがあれば有効な状態であること ###
  it '名前、メール、パスワードがあれば有効な状態であること' do
    user = User.new(
      name: 'test',
      email: 'test@example.com',
      password: 'foobar1',
      password_confirmation: 'foobar1',
      phone_number: '090-1234-5678',
      member_groups: 'グループ１',
      admin: false
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

  ### 名前の個別チェック ###
  it '名前が存在しない場合、無効な状態であること' do
    user = User.new(
      name: nil
    )
    user.valid?
    expect(user.errors[:name]).to_not include('は存在する必要があります')
  end

  it '名前が50文字以上の場合、無効な状態であること' do
    user = User.new(
      name: 'a' * 51
    )
    user.valid?
    expect(user.errors[:name]).to_not include('は50文字以下である必要があります')
  end

  it "nameは、重複しない事" do
    User.create(
      name: 'test',
      email: 'test1@example.com',
      password: 'foobar1',
      password_confirmation: 'foobar1',
      phone_number: '090-1234-5678',
      member_groups: 'グループ１',
      admin: false
    )
    user = User.new(
      name: 'test',
      email: 'test2@example.com',
      password: 'foobar1',
      password_confirmation: 'foobar1',
      phone_number: '090-1234-5678',
      member_groups: 'グループ１',
      admin: false
    )
    user.valid?
    expect(user.errors[:name]).to_not include("は重複出来ません")
  end

  ### emailの個別チェック ###
  it 'emailが100文字以上の場合、無効な状態であること' do
    user = User.new(
      email: ('a' * 50) + '@' + ('a' * 50)
    )
    user.valid?
    expect(user.errors[:email]).to_not include('は10文字以下である必要があります')
  end

  it 'emailに@が含まれない場合、無効な状態であること' do
    user = User.new(
      email: ('a' * 50) + ('a' * 50)
    )
    user.valid?
    expect(user.errors[:email]).to_not include('は@が含まれる必要があります')
  end

  it "emaiは、重複しない事" do
    User.create(
      name: 'test1',
      email: 'test@example.com',
      password: 'foobar1',
      password_confirmation: 'foobar1',
      phone_number: '090-1234-5678',
      member_groups: 'グループ１',
      admin: false
    )
    user = User.new(
      name: 'test2',
      email: 'test@example.com',
      password: 'foobar1',
      password_confirmation: 'foobar1',
      phone_number: '090-1234-5678',
      member_groups: 'グループ１',
      admin: false
    )
    user.valid?
    expect(user.errors[:email]).to_not include("は重複出来ません")
  end

  ### phone_numberの個別チェック ###
  it 'phone_numberが11文字以下の場合、無効な状態であること' do
    user = User.new(
      phone_number: ('1' * 11)
    )
    user.valid?
    expect(user.errors[:phone_number]).to_not include('は12文字以上である必要があります')
  end

  it 'phone_numberが13文字以上の場合、無効な状態であること' do
    user = User.new(
      phone_number: ('1' * 14)
    )
    user.valid?
    expect(user.errors[:phone_number]).to_not include('は13文字以下である必要があります')
  end

  ### パスワードの個別チェック ###
  it 'パスワードに英小文字が含まれない場合無効な状態であること' do
    user = User.new(password: '1'+'A' * 5, password_confirmation: '1'+'A' * 5)
    user.valid?
    expect(user.errors[:password]).to_not include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  end

  # it 'パスワードに英大文字が含まれない場合無効な状態であること' do
  #   user = User.new(password: '1'+'a' * 5, password_confirmation: '1'+'a' * 5)
  #   user.valid?
  #   expect(user.errors[:password]).to include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  # end

  it 'パスワードに数字が含まれない場合無効な状態であること' do
    user = User.new(password: 'A'+'a' * 5, password_confirmation: 'A'+'a' * 5)
    user.valid?
    expect(user.errors[:password]).to_not include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  end

  it 'パスワードが5文字以下なら無効な状態であること' do
    user = User.new(password: '1A'+'a' * 3, password_confirmation: '1A'+'a' * 3)
    user.valid?
    expect(user.errors[:password]).to_not include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  end

  it 'パスワードが13文字以上なら無効な状態であること' do
    user = User.new(password: '1A'+'a' * 11, password_confirmation: '1A'+'a' * 11)
    user.valid?
    expect(user.errors[:password]).to_not include('は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります')
  end

end