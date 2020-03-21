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
	email: "hoge@example.com",
	family_name: "山田",
	first_name: "花子",
	family_kana: "ヤマダ",
	first_kana: "ハナコ",
	postal_code: "1500041",
	street_address: "東京都渋谷区神南1丁目19-11",
	tel_number: "0368694700",
	password: "123456")
