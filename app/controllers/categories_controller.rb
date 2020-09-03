class CategoriesController < ApplicationController 
  before_action :set_category, only: [:edit, :update, :destroy]
  
  def index
    @categorias = Category.paginate(page: params[:page], per_page: 6)
  end 

  def new 
    @categoria = Category.new 
    @titulo = "Crear Categoria"
  end 

  def create 
    @categoria = Category.new(category_params)
    
    respond_to do |format|
      if @categoria.save 
        format.html { redirect_to categories_path, notice: 'Categoria Creada'}
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @categoria.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end 
    end 
  end 

  #editar
  def edit 
    @titulo = "Editar Categoria"
  end 

  def update 
    respond_to do |format|
      if @categoria.update(category_params)
        format.html { redirect_to categories_path, notice: 'Categoria Actualizada'}
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @categoria.errors.full_messages, status: :unprocessable_entity }  
        format.js { render :new }
      end  
    end 
  end 

  #eliminar
  def destroy 
    @categoria.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Categoria Eliminada'}
      format.json { head :no_content }
      format.js 
    end 
  end

  private 
    def category_params
        params.require(:category).permit(:nombre, :descripcion)      
    end

    def set_category
        @categoria = Category.find(params[:id])
    end

end