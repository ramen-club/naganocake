class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 会員ステータスの定義。1が有効、0が退会済。
  enum is_active: { 有効: 1, 退会済: 0, }

  has_many :delivers
  has_many :carts, dependent: :destroy
  has_many :relations,through: :carts,source: :cart_items
  has_many :orders, dependent: :destroy
end
