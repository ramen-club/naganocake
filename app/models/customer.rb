class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 会員ステータスの定義。1が有効、0が退会済。
  enum is_active: { 有効: 1, 退会済: 0 }

  has_many :delivers
  has_one :cart, dependent: :destroy
  has_many :relations,through: :cart,source: :cart_items
  has_many :orders, dependent: :destroy

  # 会員ステータスが「退会済」はログイン制限する
  def active_for_authentication?
    super && self.is_active == "有効"
  end

  def inactive_message
  self.is_active == "有効" ? super : :special_condition_is_not_valid
  end

end
