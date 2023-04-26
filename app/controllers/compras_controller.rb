class ComprasController < ApplicationController
# GET /compras
    def index
        @user = current_user
        @compras = @user.compras
    end
# GET /compras/1
    def show
        @user = current_user
        @compra = @user.compras.find(params[:id])
    end
# GET /compras/new
    def new
        @libro = Libro.find(params[:libro_id])
        @user = current_user
        @compra = @user.compras.new
    end
# POST /compras
    def create
        @libro = Libro.find(params[:libro_id])
        @user = current_user
        @compra = @user.compras.new(estado: "E")
        @compra.libro = @libro
        if @compra.save
            redirect_to user_compras_path(current_user.id), notice: "La compra se ha creado correctamente."
        else
            render :new, status: :unprocessable_entity
        end
    end
# GET /compras/1/edit
    def edit
        @user = current_user
        @compra = @user.compras.find(params[:id])
    end
# PATCH /compras/1
    def update
        @user = current_user
        @compra = @user.compras.find(params[:id])
        if @compra.update(compra_params)
            redirect_to :user_compras, notice: "La compra se ha actualizado correctamente."
        else
            render :edit, status: :unprocessable_entity
        end
    end
# DELETE /compras/1
    def destroy
        @user = current_user
        @compra = @user.compras.find(params[:id])
        @compra.destroy
        redirect_to :user_compras, notice: "La compra se ha eliminado correctamente."
    end
# Agregar al final de la clase por el control de accesos
    private
        def compra_params
            params.require(:compra).permit(:estado)
    end
end