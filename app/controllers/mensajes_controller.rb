class MensajesController < ApplicationController
    # GET /mensajes
    def index
        @libro = Libro.find(params[:libro_id])
        @mensajes = @libro.mensajes
    end
    # GET /mensajes/1
    def show
        @libro = Libro.find(params[:libro_id])
        @mensaje = @libro.mensajes.find(params[:id])
        #Por defecto, show visualiza la vista show.html.erb
    end
    # GET /mensajes/new
    def new
        @libro = Libro.find(params[:libro_id])
        @mensaje = @libro.mensajes.new
    end

    # POST /mensajes
    def create
        @libro = Libro.find(params[:libro_id])
        @mensaje = @libro.mensajes.new(mensaje_params)
        @mensaje.user = current_user
        if @mensaje.save
            redirect_to libro_mensajes_path(@libro.id)
        else
            render :new, status: :unprocessable_entity
        end
    end
    # GET /mensajes/1/edit
    def edit
        @libro = Libro.find(params[:libro_id])
        @mensaje = @libro.mensajes.find(params[:id])
    end
    # PATCH /Mensajes/1
    def update
        @user = current_user
        @mensaje = @user.mensajes.find(params[:id])
        if @mensaje.update(mensaje_params)
            redirect_to :libro_mensajes
        else
            render :edit, status: :unprocessable_entity
        end
    end
    # DELETE /mensaje/1
    def destroy
        @libro = Libro.find(params[:libro_id])
        @mensaje = @libro.mensajes.find(params[:id])
        @mensaje.destroy
        redirect_to :libro_mensajes, status: :see_other
    end
    # Agregar al final de la clase por el control de accesos
    private
        def mensaje_params
            params.require(:mensaje).permit(:texto)
    end
end