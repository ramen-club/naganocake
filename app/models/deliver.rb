class Deliver < ApplicationRecord


	belongs_to :customer
	validates :name, presence: true
	validates :postal_code, presence: true
	validates :street_address, presence: true

end
