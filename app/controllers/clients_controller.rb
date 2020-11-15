class ClientsController < ApplicationController 
  before_action :set_client, only: [:edit, :update, :destroy]
    
  def index
    @clientes = Client.paginate(page: params[:page], per_page: 9)
  end 
  
  def new 
    @cliente = Client.new 
    @titulo = "Agregar Cliente"
  end 
  
  def create 
    @cliente = Client.new(client_params)
     
    respond_to do |format|
      if @cliente.save 
        format.html { redirect_to clients_path, notice: 'Cliente Agregado' }
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @cliente.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end 
    end 
  end 
  
    #editar
  def edit 
    @titulo = "Editar Cliente"
  end 
  
  def update 
    respond_to do |format|
      if @cliente.update(client_params)
        format.html { redirect_to clients_path, notice: 'Cliente Actualizado'}
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @cliente.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end  
    end 
  end 
  
    #eliminar
  def destroy 
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clients_path, notice: 'Cliente Eliminado'}
      format.json { head :no_content }
      format.js 
    end 
  end
  
  private 
    def client_params
      params.require(:client).permit(:nombre, :direccion, :telefono)      
    end
  
    def set_client
      @cliente = Client.find(params[:id])
    end
  
end