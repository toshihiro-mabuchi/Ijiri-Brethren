require 'rails_helper'

RSpec.describe Gallery, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @gallery = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      image: fixture_file_upload('public/test_1.png')
    )

    @category_only = Gallery.new(
      category: 'カテゴリ',
      title: nil,
      image: nil
    )

    @title_only = Gallery.new(
      category: nil,
      title: 'タイトル',
      image: nil
    )

    @image_only = Gallery.new(
      category: nil,
      title: nil,
      image: fixture_file_upload('public/test_1.png')
    )

    @all_nil = Gallery.new(
      category: nil,
      title: nil,
      image: nil
    )

    @category_nil = Gallery.new(
      category: nil,
      title: 'タイトル',
      image: fixture_file_upload('public/test_1.png')
    )

    @title_nil = Gallery.new(
      category: nil,
      title: 'タイトル',
      image: fixture_file_upload('public/test_1.png')
    )

    @image_nil = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      image: nil
    )

    @display_nil = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      display: nil,
      image: fixture_file_upload('public/test_1.png')
    )

    @display_under = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      display: -1,
      image: fixture_file_upload('public/test_1.png')
    )

    @display_over = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      display: 2,
      image: fixture_file_upload('public/test_1.png')
    )

    @display_on = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      display: 1,
      image: fixture_file_upload('public/test_1.png')
    )

    @display_off = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      display: 0,
      image: fixture_file_upload('public/test_1.png')
    )

    @not_image_file = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      image: fixture_file_upload('public/test.pdf')
    )

    @over_image_file_size = Gallery.new(
      category: 'カテゴリ',
      title: 'タイトル',
      image: fixture_file_upload('public/test_large_11MB.jpg')
    )
  end

  it 'カテゴリとタイトルと画像があれば有効な状態であること' do
    expect(@gallery).to be_valid
  end

  it 'カテゴリのみの場合は無効な状態であること' do
    expect(@category_only).to_not be_valid
  end

  it 'タイトルのみの場合は無効な状態であること' do
    expect(@title_only).to_not be_valid
  end

  it '画像のみの場合は無効な状態であること' do
    expect(@image_only).to_not be_valid
  end

  it 'カテゴリとタイトルと画像が空の場合は無効な状態であること' do
    expect(@all_nil).to_not be_valid
  end

  it 'カテゴリが空の場合は無効な状態であること' do
    expect(@category_nil).to_not be_valid
  end

  it 'タイトルが空の場合は無効な状態であること' do
    expect(@title_nil).to_not be_valid
  end

  it '画像が空の場合は無効な状態であること' do
    expect(@image_nil).to_not be_valid
  end

  it '表示チェックの値が存在しない場合は無効であること' do
    expect(@display_nil).to_not be_valid
  end

  it '表示チェックの値が存在しない場合は無効であること' do
    expect(@display_under).to_not be_valid
  end

  it '表示チェックの値が存在しない場合は無効であること' do
    expect(@display_over).to_not be_valid
  end

  it '表示チェックの値が存在しない場合は無効であること' do
    expect(@display_on).to be_valid
  end

  it '表示チェックの値が存在しない場合は無効であること' do
    expect(@display_off).to be_valid
  end

  it 'アップロードファイルが画像ファイル以外の場合は無効であること' do
    expect(@not_image_file).to_not be_valid
  end

  it 'アップロード画像ファイルサイズが指定(10MB)以上の容量の場合は無効であること' do
    expect(@over_image_file_size).to_not be_valid
  end
end
