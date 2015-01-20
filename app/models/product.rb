class Product < ActiveRecord::Base
	has_many :orders
end
