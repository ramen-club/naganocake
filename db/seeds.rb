# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# 管理者の登録情報
Admin.create!(email: "admin@example.jp",
             password:  "ramenclub",
             password_confirmation: "ramenclub",
             admin_flg: true)

# 顧客のテストデータ20件
20.times do |n|
    Customer.create!(
      email: "hoge#{n + 1}@example.com",
      family_name: "山田",
      first_name: "太郎#{n + 1}",
      family_kana: "ヤマダ",
      first_kana: "タロウ",
      postal_code: "1500041",
      street_address: "東京都渋谷区神南#{n + 1}丁目",
      tel_number: "036869470#{n + 1}",
      password: "123456"
    )
  end

# 配送先のテストデータ
5.times do |n|
    Deliver.create!(
      customer_id: n + 1,
      name: "佐藤花子#{n + 1}",
      postal_code: "1001234",
      street_address: "北海道札幌市#{n + 1}丁目"
    )
  end

# ジャンルのテストデータ4件
Genre.create!(
  [
  {name: "ケーキ"},
  {name: "焼き菓子"},
  {name: "プリン"},
  {name: "キャンディ"}
  ]
)

# 商品のテストデータ10件
10.times do |n|
    Item.create!(
      name: "test_item#{n + 1}",
      description: "テスト商品その#{n + 1}",
      genre_id: 1,
      price: "1500"
    )
  end

# カートのテストデータ2件
2.times do |n|
    Cart.create!(
      customer_id: n + 1
    )
  end

# カート内商品のテストデータ10件
10.times do |n|
    CartItem.create!(
     item_id: n + 1,
      cart_id: 1,
      count: 2,
    )
  end
  10.times do |n|
    CartItem.create!(
     item_id: n + 1,
      cart_id: 2
    )
  end

# 注文のテストデータ10件
10.times do |n|
  Order.create!(
    customer_id: 1,
    charge: "3000",
    name: "田中二郎#{n + 1}",
    postal_code: "1009876",
    street_address: "大阪府#{n + 1}",
    order_status: 0,
    deliver_id: 1
  )
end

# 注文ID１の注文明細のテストデータ3件
3.times do |n|
  OrderDetail.create!(
    order_id: 1,
    item_id: n + 1,
    count: n + 1,
    production_status: 0,
    order_amount: "500"
  )
end
