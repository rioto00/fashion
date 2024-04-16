# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# #管理者用
 initial_genres = [
   {name: "カジュアル"},
   {name: "フォーマル"},
   {name: "ストリート"},
   {name: "ヴィンテージ"},
   {name: "テック"},
   {name: "Y2K"},
   {name: "エスニック"}, ]
 Genre.create(initial_genres)

 Admin.create!(   email: 'admin@admin',
   password: 'admin1',
   password_confirmation: "admin1"
 )

#ユーザー用
#アカウント
User.create!( [
  {
    email: "user1@example.com",
    password: "password1",
    name: "taroo",
    gender: "man",
    introduction: "SNS始めましたよろしくお願いします"
  },
  {
    email: "user2@example.com",
    password: "password2",
    name: "hanakosan",
    gender: "woman",
    introduction: "ファッション好きです！よろしくお願いします！"
  },
  {
    email: "user3@example.com",
    password: "password3",
    name: "yusuke",
    gender: "other",
    introduction: "最新のファッション情報を発信しています！"
  },
  {
    email: "user4@example.com",
    password: "password4",
    name: "ayumi",
    gender: "woman",
    introduction: "トレンドに敏感なファッション好きです！"
  },
  {
    email: "user5@example.com",
    password: "password5",
    name: "kenta",
    gender: "other",
    introduction: "洋服のコーディネートが得意です！"
  },
  {
    email: "user6@example.com",
    password: "password6",
    name: "sakurasaku",
    gender: "woman",
    introduction: "おしゃれ大好き！一緒に楽しみましょう！"
  },
  {
    email: "user7@example.com",
    password: "password7",
    name: "takumifire",
    gender: "man",
    introduction: "ファッションアイテムに詳しいです！"
  },
  {
    email: "user8@example.com",
    password: "password8",
    name: "mai_xx",
    gender: "woman",
    introduction: "季節ごとのトレンドをチェックしています！"
  },
  {
    email: "user9@example.com",
    password: "password9",
    name: "shokk",
    gender: "other",
    introduction: "ストリートファッションが好きです！"
  },
  {
    email: "user10@example.com",
    password: "password10",
    name: "naomi428",
    gender: "woman",
    introduction: "ファッションブランドが大好きです！"
  }
])

#投稿
Post.create!( [
  {
    title: "春",
    content: "春に向けてコーディネートしました",
  }
])