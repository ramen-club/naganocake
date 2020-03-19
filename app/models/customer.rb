class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 会員ステータスの定義。有効がtrue、退会済がfalse。
  enum is_active: { effectiveness: true, invalidation: false}

  has_many :delivers
  has_many :carts, dependent: :destroy
end
