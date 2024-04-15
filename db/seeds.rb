# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者用
initial_genres = [
  {name: "カジュアル"},
  {name: "フォーマル"},
  {name: "ストリート"},
  {name: "ヴィンテージ"},
  {name: "テック"},
  {name: "Y2K"},
  {name: "エスニック"},
]
Genre.create(initial_genres)

Admin.create!(
   email: 'admin@admin',
   password: 'admin1',
   password_confirmation: "admin1"
)

#ユーザー用
#アカウント
initial_users = [
  {
    email: "user1@example.com",
    encrypted_password: "password1",
    name: "taroo",
    gender: "1",
    introduction: "SNS始めましたよろしくお願いします"
  },
  {
    email: "user2@example.com",
    encrypted_password: "password2",
    name: "hanakosan",
    gender: "2",
    introduction: "ファッション好きです！よろしくお願いします！"
  },
  {
    email: "user3@example.com",
    encrypted_password: "password3",
    name: "yusuke",
    gender: "3",
    introduction: "最新のファッション情報を発信しています！"
  },
  {
    email: "user4@example.com",
    encrypted_password: "password4",
    name: "ayumi",
    gender: "2",
    introduction: "トレンドに敏感なファッション好きです！"
  },
  {
    email: "user5@example.com",
    encrypted_password: "password5",
    name: "kenta",
    gender: "3",
    introduction: "洋服のコーディネートが得意です！"
  },
  {
    email: "user6@example.com",
    encrypted_password: "password6",
    name: "sakurasaku",
    gender: "2",
    introduction: "おしゃれ大好き！一緒に楽しみましょう！"
  },
  {
    email: "user7@example.com",
    encrypted_password: "password7",
    name: "takumifire",
    gender: "1",
    introduction: "ファッションアイテムに詳しいです！"
  },
  {
    email: "user8@example.com",
    encrypted_password: "password8",
    name: "mai_xx",
    gender: "2",
    introduction: "季節ごとのトレンドをチェックしています！"
  },
  {
    email: "user9@example.com",
    encrypted_password: "password9",
    name: "shokk",
    gender: "3",
    introduction: "ストリートファッションが好きです！"
  },
  {
    email: "user10@example.com",
    encrypted_password: "password10",
    name: "naomi428",
    gender: "2",
    introduction: "ファッションブランドが大好きです！"
  }
]

#投稿
initial_posts = [
  {
    title: "春",
    content: "春に向けてコーディネートしました",
  }
]