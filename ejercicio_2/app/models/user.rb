class User < ApplicationRecord
    # Se valida que los campos no sean nulos en el formulario
    validates :tipo, :identificacion, :emision_id, :venc_id, :nombre, :correo, :tlf_prin, presence: true
    # Se valida que la identificacion es unica
    validates :identificacion, uniqueness: true
    # Se valida que nombre solo tenga valores alfanumericos y acepte acentos
    validates :nombre, format: {with: /\A[a-zA-Z\u00C0-\u00FF0-9\s]*\z/, message: "Solo valores alfanumericos, se acepta acentos"}
    # Se valida que el tlf inicie con 0
    validates :tlf_prin, format: {with: /\A[0]/, message: "El tlf debe iniciar por '0'"}
    # Se valida que el tlf e identificacion sean unicamente numeros
    validates :tlf_prin, :identificacion, numericality: true
    # Se valida el formato del correo, este formato se obtuvo de 'https://medium.com/@jgratereaux/validar-correos-electr%C3%B3nicos-con-expresiones-regulares-7914751b6018'
    validates :correo, format: {with: /\A(([^<>()\[\]\\.,;:\s@”]+(\.[^<>()\[\]\\.,;:\s@”]+)*)|(“.+”))@((\[[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}])|(([a-zA-Z\-0–9]+\.)+[a-zA-Z]{2,}))\z/, 
                                message: "Formato de correo invalido"}
end
