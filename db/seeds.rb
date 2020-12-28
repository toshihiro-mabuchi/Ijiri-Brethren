# coding: utf-8

User.create!(name: "管理者",
             email: "admin@email.com",
             password: "Passw0rd",
             password_confirmation: "Passw0rd",
             phone_number: "012-3456-7890",
             admin: true)

User.create!(name: "会員様１",
             email: "sample1@email.com",
             password: "password1",
             phone_number: "111-1111-1111",
             member_groups: "正会員",
             password_confirmation: "password1")

User.create!(name: "会員様２",
             email: "sample2@email.com",
             password: "password2",
             phone_number: "222-2222-2222",
             member_groups: "正会員",
             password_confirmation: "password2")

User.create!(name: "会員様３",
             email: "sample3@email.com",
             password: "password3",
             phone_number: "333-3333-3333",
             member_groups: "正会員",
             password_confirmation: "password3")

User.create!(name: "会員様４",
             email: "sample4@email.com",
             password: "password4",
             phone_number: "444-4444-4444",
             member_groups: "準会員",
             password_confirmation: "password4")
 
User.create!(name: "会員様５",
             email: "sample5@email.com",
             password: "password5",
             phone_number: "555-5555-5555",
             member_groups: "準会員",
             password_confirmation: "password5")
 
User.create!(name: "会員様６",
             email: "sample6@email.com",
             password: "password6",
             phone_number: "666-6666-6666",
             member_groups: "準会員",
             password_confirmation: "password6")
