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

# 顧客のテストデータ
Customer.create!(
  [
  {
	email: "hoge@example.com",
	family_name: "山田",
	first_name: "花子",
	family_kana: "ヤマダ",
	first_kana: "ハナコ",
	postal_code: "1500041",
	street_address: "東京都渋谷区神南1丁目19-11",
	tel_number: "0368694700",
	password: "123456"
  },
  {
  	email: "hoge2@example.com",
	family_name: "佐藤",
	first_name: "太郎",
	family_kana: "サトウ",
	first_kana: "タロウ",
	postal_code: "1234567",
	street_address: "東京都中央区",
	tel_number: "09012345678",
	password: "123456"
  }
  ]
)

Genre.create!(name: "aaaa",
	is_active: true)

Item.create!(name: "item_a",
	genre_id: 1)

Cart.create!(customer_id: 1)

CartItem.create!(item_id: 1,
	cart_id: 1)
CartItem.create!(item_id: 1,
	cart_id: 1)

10.times do |n|
    Item.create!(
      genre_id: 1,
      name: "test#{n + 1}"
    )
  end
2.times do |n|
    Cart.create!(
      customer_id: n + 1,
    )
  end

10.times do |n|
    CartItem.create!(
     item_id: n + 1,
      cart_id: 1,

    )
  end
