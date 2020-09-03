class Supplier < ApplicationRecord
  has_many :products 
  has_many :warehouses
end
