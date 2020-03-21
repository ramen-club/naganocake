class Genre < ApplicationRecord
    has_many :admin_items, dependent: :destroy
    has_many :items, dependent: :destroy

end
