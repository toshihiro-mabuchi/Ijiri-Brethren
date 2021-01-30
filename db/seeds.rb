# coding: utf-8

# ユーザーサンプルデーター作成

User.create!(name: "管理者",
             email: "admin@gmail.com",
             password: "Passw0rd",
             password_confirmation: "Passw0rd",
             phone_number: "012-3456-7890",
             admin: true)

puts "管理者作成！"

6.times do |i|
  n = i + 1 
  name_number = n.to_s.tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  group = "１"
  group = "２" if n > 3
  User.create!(name: "会員様#{name_number}",
               email: "sample#{n}@gmail.com",
               password: "password#{n}",
               phone_number: "#{n*111}-#{n*1111}-#{n*1111}",
               member_groups: "グループ#{group}",
               password_confirmation: "password#{n}")
end

puts "会員様作成！"


# お知らせサンプルデーター作成

3.times do |i|
  n = i + 1 
  number = n.to_s.tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  Info.create!(title: "会員様向けお知らせタイトル#{number}",
               content: "会員様向けお知らせ本文#{number}",
               category: "メンバー")
end

puts "会員様向けお知らせ作成！"

3.times do |i|
  n = i + 1 
  number = n.to_s.tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  Info.create!(title: "一般向けお知らせタイトル#{number}",
               content: "一般向けお知らせ本文#{number}",
               category: "一般")
end

puts "一般向けお知らせ作成！"

# 動画サンプルデーター作成

Movie.create!(title: "クリスマス曲　きよしこの夜",
              thumbnail_url: "https://i.ytimg.com/vi/97Ur9G0EFzM/hqdefault.jpg",
              youtube_mid: "97Ur9G0EFzM",
              youtube_url: "https://youtu.be/97Ur9G0EFzM",
              author_name: "doyokayo",
              category: "メンバー")

Movie.create!(title: "【讃美歌320番】主よ御許に近づかん Nearer,My God,to Thee",
              thumbnail_url: "https://i.ytimg.com/vi/VHLVDYQ9n5g/hqdefault.jpg",
              youtube_mid: "VHLVDYQ9n5g",
              youtube_url: "https://youtu.be/VHLVDYQ9n5g",
              author_name: "S K",
              category: "メンバー")

Movie.create!(title: "讃美歌461番「主われを愛す」",
              thumbnail_url: "https://i.ytimg.com/vi/xJ0cJ5DQeIs/hqdefault.jpg",
              youtube_mid: "xJ0cJ5DQeIs",
              youtube_url: "https://youtu.be/xJ0cJ5DQeIs",
              author_name: "meijigakuin",
              category: "メンバー")

Movie.create!(title: "クリスマス曲　きよしこの夜",
              thumbnail_url: "https://i.ytimg.com/vi/97Ur9G0EFzM/hqdefault.jpg",
              youtube_mid: "97Ur9G0EFzM",
              youtube_url: "https://youtu.be/97Ur9G0EFzM",
              author_name: "doyokayo",
              category: "一般")

Movie.create!(title: "賛美歌３１２番（いつくしみ深き）",
              thumbnail_url: "https://i.ytimg.com/vi/Bo-Cmd3JM4c/hqdefault.jpg",
              youtube_mid: "Bo-Cmd3JM4c",
              youtube_url: "https://youtu.be/Bo-Cmd3JM4c",
              author_name: "backbone777",
              category: "一般")
                
Movie.create!(title: "賛美歌３２０番」主よみもとに近づかん",
              thumbnail_url: "https://i.ytimg.com/vi/yX2iv6q-tME/hqdefault.jpg",
              youtube_mid: "yX2iv6q-tME",
              youtube_url: "https://youtu.be/yX2iv6q-tME",
              author_name: "sabukiti1",
              category: "一般")

Movie.create!(title: "讃美歌461番「主われを愛す」",
              thumbnail_url: "https://i.ytimg.com/vi/xJ0cJ5DQeIs/hqdefault.jpg",
              youtube_mid: "xJ0cJ5DQeIs",
              youtube_url: "https://youtu.be/xJ0cJ5DQeIs",
              author_name: "meijigakuin",
              category: "一般")

puts "動画サンプルデータ作成！"