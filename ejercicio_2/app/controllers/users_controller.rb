class UsersController < ApplicationController
    # Es una accion que sucedera antes de show, edit, update y destroy
    before_action :find_user, except: [:index, :new, :create]
    
    def find_user
        # Busca el usuario de acuerdo a su ID
        @user = User.find(params[:id])
    end

    def index
    end

    def new
        @user = User.new    # Crea un nuevo item en la tabla vacio
    end

    def create
        # Ingresa los valores del formulario en el nuevo item
        @user = User.create!(tipo: params[:user][:tipo], identificacion: params[:user][:identificacion], emision_id: params[:user][:emision_id], venc_id: params[:user][:venc_id], nombre: params[:user][:nombre], correo: params[:user][:correo], tlf_prin: params[:user][:tlf_prin], tlf_sec: params[:user][:tlf_sec])
        redirect_to @user
    end

    def show
    end

    def edit  
    end

    def update
        # Actualiza los valores del usuario a traves del HTML de edit
        @user.update!(tipo: params[:user][:tipo], identificacion: params[:user][:identificacion], emision_id: params[:user][:emision_id], venc_id: params[:user][:venc_id], nombre: params[:user][:nombre], correo: params[:user][:correo], tlf_prin: params[:user][:tlf_prin], tlf_sec: params[:user][:tlf_sec])
        redirect_to @user
    end
    
    def destroy
        # Elimina el usuario
        @user.destroy
        redirect_to root_path
    end
end
