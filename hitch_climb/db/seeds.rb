# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w(エリナ エチオピア キム@香港 シャドー キャシー 変なおじさん 髭男dism tom シャネル　mike ジャッカル ジョン・カビラ sunshine インディ ロン ダンブルドア ミャーゴ カカオ lake ane chocolate チェロ　トライアングル tomato ハワイ クリケット 叶 風子 トゥース 卑弥呼)

if Rails.env == "production"
  30.times do |i|
    user=User.create!(nickname: names, email: "test#{i + 1}@example.com", password: "password", password_confirmation: "password")
    user.image.attach(io: File.open('public/seed/profile-#{i +1}.jpeg'), filename: 'profile-#{i +1}.jpeg')

    event=Event.create!(head: "" , body: "", user_id: user.id)
    event.image.attach(io: File.open('public/seed/event-#{i +1}.jpeg'), filename: 'event-#{i +1}.jpeg')
  end
  puts 'ユーザーデータの保存に成功しました'
end

#require "csv"
#
#CSV.foreach('db/seeds/csv/content.csv', headers: true) do |row|
#  Content.create(
#      title: row['title'],
#      image_url :row['image_url'],
#                director: row['director'],
#                description: row['description'],
#                open_date: row['open_date']
#      )
#end