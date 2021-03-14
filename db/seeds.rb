# coding: utf-8

# ユーザーサンプルデーター作成

User.create!(name: "管理者",
             email: "admin@gmail.com",
             password: "Passw0rd",
             password_confirmation: "Passw0rd",
             phone_number: "012-3456-7890",
             admin: true)

puts "管理者作成！"

30.times do |i|
  n = i + 1 
  name_number = n.to_s.tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  group = "１"
  group = "２" if n > 15
  User.create!(name: "メンバー#{name_number}",
               email: "sample#{n}@gmail.com",
               password: "password#{n}",
               phone_number: "012-3456-7890",
               member_groups: "グループ#{group}",
               password_confirmation: "password#{n}")
end

puts "メンバー作成！"

# お知らせサンプルデーター作成

3.times do |i|
  n = i + 1 
  number = n.to_s.tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  Info.create!(title: "メンバー向けお知らせタイトル#{number}",
               content: "メンバー向けお知らせ本文#{number}",
               category: "メンバー",
               display_flag: true)
end

puts "メンバー向けお知らせ作成！"

3.times do |i|
  n = i + 1 
  number = n.to_s.tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  Info.create!(title: "一般向けお知らせタイトル#{number}",
               content: "一般向けお知らせ本文#{number}",
               category: "一般",
               display_flag: true)
end

puts "一般向けお知らせ作成！"


# 動画サンプルデーター作成

Movie.create!(title: "賛美歌３１２番（いつくしみ深き）",
              thumbnail_url: "https://i.ytimg.com/vi/Bo-Cmd3JM4c/hqdefault.jpg",
              youtube_mid: "Bo-Cmd3JM4c",
              youtube_url: "https://youtu.be/Bo-Cmd3JM4c",
              author_name: "backbone777",
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
    
Movie.create!(title: "主の愛に生かされて",
              thumbnail_url: "https://i.ytimg.com/vi/zI2GcNhvovg/hqdefault.jpg",
              youtube_mid: "zI2GcNhvovg",
              youtube_url: "https://youtu.be/zI2GcNhvovg",
              author_name: "mickey71066",
              category: "メンバー")

Movie.create!(title: "輝く日を仰ぐとき",
              thumbnail_url: "https://i.ytimg.com/vi/y3Mia_nTRgc/hqdefault.jpg",
              youtube_mid: "y3Mia_nTRgc",
              youtube_url: "https://youtu.be/y3Mia_nTRgc",
              author_name: "ANNIALIVE1112",
              category: "メンバー")

Movie.create!(title: "小さな祈り",
              thumbnail_url: "https://i.ytimg.com/vi/yTyLafZeWX4/hqdefault.jpg",
              youtube_mid: "yTyLafZeWX4",
              youtube_url: "https://youtu.be/yTyLafZeWX4",
              author_name: "mickey71066",
              category: "メンバー")

Movie.create!(title: "クリスマス曲　きよしこの夜",
              thumbnail_url: "https://i.ytimg.com/vi/97Ur9G0EFzM/hqdefault.jpg",
              youtube_mid: "97Ur9G0EFzM",
              youtube_url: "https://youtu.be/97Ur9G0EFzM",
              author_name: "doyokayo",
              category: "メンバー")

Movie.create!(title: "「賛美歌３１０番」しずけきいのり",
              thumbnail_url: "https://i.ytimg.com/vi/d9IqHInaQMA/hqdefault.jpg",
              youtube_mid: "d9IqHInaQMA",
              youtube_url: "https://youtu.be/d9IqHInaQMA",
              author_name: "sabukiti1",
              category: "一般")

Movie.create!(title: "賛美歌３１２番（いつくしみ深き）",
              thumbnail_url: "https://i.ytimg.com/vi/Bo-Cmd3JM4c/hqdefault.jpg",
              youtube_mid: "Bo-Cmd3JM4c",
              youtube_url: "https://youtu.be/Bo-Cmd3JM4c",
              author_name: "backbone777",
              category: "一般")
    
Movie.create!(title: "「賛美歌３２０番」主よみもとに近づかん",
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

Movie.create!(title: "クリスマス曲　きよしこの夜",
              thumbnail_url: "https://i.ytimg.com/vi/97Ur9G0EFzM/hqdefault.jpg",
              youtube_mid: "97Ur9G0EFzM",
              youtube_url: "https://youtu.be/97Ur9G0EFzM",
              author_name: "doyokayo",
              category: "一般")

Movie.create!(title: "クリスマス曲　きよしこの夜",
              thumbnail_url: "https://i.ytimg.com/vi/97Ur9G0EFzM/hqdefault.jpg",
              youtube_mid: "97Ur9G0EFzM",
              youtube_url: "https://youtu.be/97Ur9G0EFzM",
              author_name: "doyokayo",
              category: "一般")

puts "動画サンプルデータ作成！"


# お便りサンプルデータ作成

24.times do |i|
  n = i + 1
  article = Article.new
  article.issue_date = Date.current - 24.month + n.month
  article.letter.attach(io: File.open("public/test.pdf"), filename: "test.pdf")
  article.save
end

puts "お便りサンプル作成！"

# 画像サンプルデータ作成

array = [["test_1.png", "ねこ"], ["test_2.png", "ねこ"], ["test_3.jpg", "背景"], ["test_4.jpg", "背景"], ["test_5.jpeg", "アイコン"]]
10.times do |i|
  image_data = array[rand(5)]
  n = i + 1
  gallery = Gallery.new
  gallery.category = image_data[1]
  gallery.title = "ギャラリーアイテムタイトル#{n}"
  gallery.image.attach(io: File.open("public/#{image_data[0]}"), filename: "#{image_data[0]}")
  gallery.save
end

puts "画像サンプル作成！"

# 御言葉サンプルデータ作成（"https://www.hyuki.com/bible/"から引用）

# 自分をつまらない人間だと思っている人へ
Bible.create!(title: "イザヤ書",
              subtitle: "４３章４節より",
              text: "「わたしの目には、あなたは高価で尊い。わたしはあなたを愛している。」",
              display_flag: true)

# おびえている人へ
Bible.create!(title: "イザヤ書",
              subtitle: "４１章１０節より",
              text: "「恐れるな。わたしはあなたとともにいる。たじろぐな。わたしがあなたの神だから。」")

# 変わることなく永遠に続くものってあるの？
Bible.create!(title: "イザヤ書",
              subtitle: "４０章６節から８節より",
              text: "「すべての人は草、 その栄光は、すべて野の花のようだ。主のいぶきがその上に吹くと、 草は枯れ、花はしぼむ。まことに、民は草だ。草は枯れ、花はしぼむ。だが、私たちの神のことばは永遠に立つ。」")

# 愛って何ですか？
Bible.create!(title: "コリントの信徒への手紙一",
              subtitle: "１３章４節から７節より",
              text: "「愛は寛容であり、愛は親切です。また人をねたみません。愛は自慢せず、高慢になりません。礼儀に反することをせず、自分の利益を求めず、 怒らず、人のした悪を思わず、不正を喜ばずに真理を喜びます。すべてをがまんし、すべてを信じ、すべてを期待し、すべてを耐え忍びます。」")

# 自分にしてもらいたいことがある人へ
Bible.create!(title: "マタイによる福音書",
              subtitle: "７章１２節より",
              text: "「それで、何事でも、 自分にしてもらいたいことは、 ほかの人にもそのようにしなさい。これが律法であり預言者です。」")

# 疲れてしまった人へ
Bible.create!(title: "マタイによる福音書",
              subtitle: "１１章２８節より",
              text: "「すべて、疲れた人、 重荷を負っている人は、 わたしのところに来なさい。わたしがあなたがたを休ませてあげます。」")

# 男と女、結婚って何だろうか？
Bible.create!(title: "マルコによる福音書",
              subtitle: "１０章６節から９節より",
              text: "「しかし、創造の初めから、 神は、人を男と女に造られたのです。それゆえ、人はその父と母を離れて、 ふたりの者が一心同体になるのです。それで、もはやふたりではなく、ひとりなのです。こういうわけで、人は、 神が結び合わせたものを引き離してはなりません。」")

# 永遠のいのちを得たい人へ
Bible.create!(title: "ヨハネの第一の手紙",
              subtitle: "５章１１節、１２節より",
              text: "「そのあかしとは、神が私たちに永遠のいのちを与えられたということ、 そしてこのいのちが御子のうちにあるということです。御子を持つものはいのちを持っており、 御子を持たないものはいのちを持っていません。」")

# 罪と死、神といのち
Bible.create!(title: "ローマの信徒への手紙",
              subtitle: "６章２３節より",
              text: "「罪から来る報酬は死です。しかし、神の下さる賜物は、 私たちの主キリスト・イエスにある永遠のいのちです。」")

# 罪をおかしてしまった人へ
Bible.create!(title: "ヨハネの第一の手紙",
              subtitle: "１章９節より",
              text: "「もし、私たちが自分の罪を言い表わすなら、 神は真実で正しい方ですから、その罪を赦し、 すべての悪から私たちをきよめてくださいます。」")

# 私のために死んだ人って誰？
Bible.create!(title: "ローマの信徒への手紙",
              subtitle: "５章７節、８節より",
              text: "「正しい人のためにでも死ぬ人はほとんどありません。情け深い人のためには、進んで死ぬ人があるいはいるでしょう。しかし私たちがまだ罪人であったとき、 キリストが私たちのために死んでくださったことにより、 神は私たちに対するご自身の愛を明らかにしておられます。」")

# どんな風に愛したらいいですか？
Bible.create!(title: "ヨハネの第一の手紙",
              subtitle: "３章１８節より",
              text: "「子どもたちよ。私たちは、ことばや口先だけで愛することをせず、 行ないと真実をもって愛そうではありませんか。」")

# 神さまは願いを聞いてくださる
Bible.create!(title: "ヨハネの第一の手紙",
              subtitle: "５章１４節より",
              text: "「何事でも神のみこころにかなう願いをするなら、 神はその願いを聞いてくださるということ、 これこそ神に対する私たちの確信です。」")

# 霊
Bible.create!(title: "ヨハネの第一の手紙",
              subtitle: "４章１節より",
              text: "「愛する者たち。霊だからといって、みな信じてはいけません。それらの霊が神からのものかどうかを、ためしなさい。なぜなら、にせ預言者がたくさん世に出て来たからです。」")

# 私なんかどうせ…と思う人へ
Bible.create!(title: "マルコによる福音書",
              subtitle: "２章１７節より",
              text: "イエスはこれを聞いて、彼らにこう言われた。「医者を必要とするのは丈夫な者ではなく、病人です。わたしは正しい人を招くためではなく、罪人を招くために来たのです。」")

# 富を得たいと思う人へ
Bible.create!(title: "マルコによる福音書",
              subtitle: "８章３６節より",
              text: "「人は、たとい全世界を得ても、いのちを損じたら、何の得がありましょう。」")

# 神さまには何ができるのでしょうか？
Bible.create!(title: "ルカによる福音書",
              subtitle: "１章３７節より",
              text: "「神にとって不可能なことは一つもありません。」")

# 時について
Bible.create!(title: "伝道者の書",
              subtitle: "３章１節より",
              text: "「天の下では、何事にも定まった時期があり、 すべての営みには時がある。」")

# なんて、あいつは馬鹿なんだろう…
Bible.create!(title: "ローマ人への手紙",
              subtitle: "１２章１０節、１６節より",
              text: "「兄弟愛をもって心から互いに愛し合い、 尊敬をもって互いに人を自分よりまさっていると思いなさい。互いに一つ心になり、高ぶった思いを持たず、 かえって身分の低い者に順応しなさい。自分こそ知者だなどと思ってはいけません。」")

puts "御言葉サンプルデータ作成！"
