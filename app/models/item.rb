class Item < ApplicationRecord
    has_many :carts, dependent: :destroy
end
