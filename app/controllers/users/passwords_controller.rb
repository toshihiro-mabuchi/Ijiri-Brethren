# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :check_admin, only: :create
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  def check_admin
    email = resource&.email || params[:user][:email].downcase
    if email == 'admin@gmail.com'
      flash[:danger] = "管理者の変更はできません。" 
      redirect_to new_user_password_path
    end
  end

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
