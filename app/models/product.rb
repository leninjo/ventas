class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :warehouses
  has_one_attached :imagen

  def self.search(search)
    if search 
      where(["nombre LIKE ?", "%#{search}%"])
    else
      Product.all 
    end 
  end 
end
