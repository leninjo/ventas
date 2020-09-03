class Product < ApplicationRecord
  belongs_to :categories
  belongs_to :suppliers
  has_many :warehouses
end
