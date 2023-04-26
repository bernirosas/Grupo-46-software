class ResenasController < ApplicationController
    # GET /resenas
    def index
        @libro = Libro.find(params[:libro_id])
        @resenas = @libro.resenas
    end
# GET /resenas/1
    def show
        @libro = Libro.find(params[:libro_id])
        @resena = @libro.resenas.find(params[:id])
    end
    # GET /resenas/new
    def new
        @libro = Libro.find(params[:libro_id])
        @resena = @libro.resenas.new
    end
    # POST /resenas
    def create
        @libro = Libro.find(params[:libro_id])
        @resena = @libro.resenas.new(resena_params)
        @resena.user = current_user
        if @resena.save
            redirect_to libro_resenas_path(@libro.id)
        else
            render :new, status: :unprocessable_entity
        end
    end
    # GET /resenas/1/edit
    def edit
        @libro = Libro.find(params[:libro_id])
        @resena = @libro.resenas.find(params[:id])
    end
    # PATCH /resenas/1
    def update
        @user = current_user
        @resena = @user.resenas.find(params[:id])
        if @resena.update(resena_params)
            redirect_to :libro_resenas
        else
            render :edit, status: :unprocessable_entity
        end
    end
    # DELETE /resena/1
    def destroy
        @libro = Libro.find(params[:libro_id])
        @resena = @libro.resenas.find(params[:id])
        @resena.destroy
        redirect_to :libro_resenas, status: :see_other
    end
    # Agregar al final de la clase por el control de accesos
        private
    def resena_params
        params.require(:resena).permit(:titulo, :cuerpo)
        end
    end
