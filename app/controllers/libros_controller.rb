class LibrosController < ApplicationController

  def new
    @libro = Libro.new
  end
    
  def create
    @libro = Libro.new(libro_params)
      if @libro.save
        redirect_to @libro
      else
        render :new, status: :unprocessable_entity
      end
  end
    
  def index
    @libros = Libro.all
  end

  def show
    @libro = Libro.find(params[:id])
  end
    
  def destroy
    @libro = Libro.find(params[:id])
      @libro.destroy

      redirect_to :libros, status: :see_other
  end

  def edit
    @libro = Libro.find(params[:id])
  end

  def update
    @libro = Libro.find(params[:id])
      if @libro.update(libro_params)
        redirect_to @libro
      else
        render :edit, status: :unprocessable_entity
      end
  end
    
    private
  def libro_params
    params.require(:libro).permit(:titulo, :fecha, :categoria, :autor, :precio, :stock, :descripcion)
    end
end
