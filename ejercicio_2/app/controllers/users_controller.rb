class UsersController < ApplicationController

    def new
        @user = User.new    # Crea un nuevo item en la tabla vacio
    end

    def create
        # Ingresa los valores del formulario en el nuevo item
        @user = User.create!(tipo: params[:user][:tipo], identificacion: params[:user][:identificacion], emision_id: params[:user][:emision_id], venc_id: params[:user][:venc_id], nombre: params[:user][:nombre], correo: params[:user][:correo], tlf_prin: params[:user][:tlf_prin], tlf_sec: params[:user][:tlf_sec])
        render json: @user
    end

    def show
        @user = User.find(params[:id])
    end
end
