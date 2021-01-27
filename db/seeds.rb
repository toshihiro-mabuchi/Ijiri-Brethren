# coding: utf-8

User.create!(name: "管理者",
             email: "admin@gmail.com",
             password: "Passw0rd",
             password_confirmation: "Passw0rd",
             phone_number: "012-3456-7890",
             admin: true)
puts "管理者作成！"

6.times do |i|
   n = i + 1 
  group = "１"
  group = "２" if n > 3
  User.create!(name: "member#{n}",
               email: "sample#{n}@gmail.com",
               password: "password#{n}",
               phone_number: "#{n*111}-#{n*1111}-#{n*1111}",
               member_groups: "グループ#{group}",
               password_confirmation: "password#{n}")
end
puts "会員様作成！"

