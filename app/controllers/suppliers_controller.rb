class SuppliersController < ApplicationController 
  before_action :set_supplier, only: [:edit, :update, :destroy]
    
  def index
    @proveedores = Supplier.paginate(page: params[:page], per_page: 9)
  end 
  
  def new 
    @proveedor = Supplier.new 
    @titulo = "Agregar Proveedor"
  end 
  
  def create 
    @proveedor = Supplier.new(supplier_params)
     
    respond_to do |format|
      if @proveedor.save 
        format.html { redirect_to suppliers_path, notice: 'Proveedor Agregado' }
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @proveedor.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end 
    end 
  end 
  
    #editar
  def edit 
    @titulo = "Editar Proveedor"
  end 
  
  def update 
    respond_to do |format|
      if @proveedor.update(supplier_params)
        format.html { redirect_to suppliers_path, notice: 'Proveedor Actualizado'}
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @proveedor.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end  
    end 
  end 
  
    #eliminar
  def destroy 
    @proveedor.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_path, notice: 'Proveedor Eliminado'}
      format.json { head :no_content }
      format.js 
    end 
  end
  
  private 
    def supplier_params
      params.require(:supplier).permit(:nombre, :direccion, :telefono)      
    end
  
    def set_supplier
      @proveedor = Supplier.find(params[:id])
    end
  
end