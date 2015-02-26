class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	ratyrate_rateable "overall"
end
