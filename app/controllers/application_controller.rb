class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました。" 
      redirect_to root_path
    else
      flash[:danger] = "ログインに失敗しました。ログインをやり直して下さい。" 
      redirect_to new_user_session_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "ログアウトしました。"
    root_path
  end

  # サインイン済みのユーザーか確認する。
  def signed_in_user
    unless user_signed_in?
      # flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
  end

  # システム管理権限所有かどうか判定する。
  def admin_user
    # flash[:danger] = "権限がありません。"
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end


  private

    def correct_user
      user = User.find(params[:user_id])
      redirect_to root_path unless user == current_user
    end

    def no_admin_return
      redirect_to root_path unless current_user.admin?
    end

    def no_logged_in_return
      redirect_to root_path unless user_signed_in?
    end


  protected

    def configure_permitted_parameters
      added_attrs = [:name, :email, :member_groups, :phone_number, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

end
