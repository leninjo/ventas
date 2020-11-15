class ProductsController < ApplicationController 
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]
  before_action :set_suppliers, only: [:new, :edit]
    
  def index
    @productos = Product.search(params[:search]).order("nombre DESC").paginate(page: params[:page], per_page: 3)
  end 
  
  def new 
    @producto = Product.new 
    @titulo = "Agregar Producto"
  end 
  
  def create 
    @producto = Product.new(product_params)
    respond_to do |format|
      if @producto.save 
        format.html { redirect_to products_path, notice: 'Producto Agregado'}
      else
        format.json { render json: @producto.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end 
    end 
  end 
  
    #editar
  def edit 
    @titulo = "Editar Producto"
  end 
  
  def update 
    respond_to do |format|
      if @producto.update(product_params)
        format.html { redirect_to products_path, notice: 'Producto Actualizado'}
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @producto.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end  
    end 
  end 
  
    #eliminar
  def destroy 
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Producto Eliminado'}
      format.json { head :no_content }
      format.js 
    end 
  end
  
  private 
    def product_params
      params.require(:product).permit(:nombre, :imagen, :marca, :modelo, :existencia, :precio, :category_id, :supplier_id)      
    end
  
    def set_product
      @producto = Product.find(params[:id])
    end

    def set_categories
      @categorias = Category.all 
    end 

    def set_suppliers 
      @proveedores = Supplier.all 
    end 
end 