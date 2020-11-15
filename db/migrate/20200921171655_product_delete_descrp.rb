class ProductDeleteDescrp < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :descripcion, :string
  end
end
