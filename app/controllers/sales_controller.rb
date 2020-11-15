class SalesController < ApplicationController 
  before_action :set_sale, only: [:edit]
    
  def index
    @ventas = Sale.all 
  end 

  def new 
    @venta = Sale.create(total: 0)
    redirect_to edit_sale_path(@venta)
  end 

  def edit 
    @productos_venta = @venta.sale_details
  end 

  def destroy
    @venta.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Venta elminada"}
      format.json { head :no_content}
    end 
  end 

  private 

  def set_sale
    @venta = Sale.find(params[:id])
  end 

end