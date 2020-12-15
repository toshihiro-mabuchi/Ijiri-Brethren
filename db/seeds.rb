# coding: utf-8

User.create!(name: "管理者",
             email: "admin@email.com",
             password: "Passw0rd",
             password_confirmation: "Passw0rd",
             admin: true)