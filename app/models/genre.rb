class Genre < ApplicationRecord
    has_many :admin_items, dependent: :destroy
    has_many :items, dependent: :destroy

    enum is_active: {
        無効: 0,
        有効: 1,
    }

end
