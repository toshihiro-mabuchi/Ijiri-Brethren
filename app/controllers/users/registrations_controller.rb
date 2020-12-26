# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      flash
      redirect_to new_user_registration_path, alert: 'パスワードが一致していません。'
    else
      if @user = User.find_by(name: params[:user][:name])
        redirect_to new_user_registration_path, alert: '同じ名前が存在します。'
      else
        @user = User.new(user_params)
        if @user.save
          # sign_in @user
          redirect_to users_path, notice: 'アカウントの作成に成功しました。'
        else
          redirect_to new_user_registration_path, alert: 'アカウントの作成に失敗しました。'
        end
      end
    end
  end

  # GET /resource/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # PUT /resource
  def update
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: '会員様の更新に成功しました。'
    else
      redirect_to users_path, notice: '会員様情報の更新に失敗しました。'
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

    def user_params
      params.require(:user)
        .permit(:name, :email, :member_groups, :phone_number, :password, :password_confirmation)
    end

    def update_params
      params.require(:user)
        .permit(:member_groups, :phone_number)
    end

  protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    # def configure_update_params
    #   # added_attrs = [:member_groups, :pheone_number]
    #   added_attrs = [:member_groups, :phone_number]
    #   devise_parameter_sanitizer.permit :update, keys: added_attrs
    # end

end
