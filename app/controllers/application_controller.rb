class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました。" 
      root_path
    else
      flash[:danger] = "ログインに失敗しました。ログインをやり直して下さい。" 
      new_user_session_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "ログアウトしました。"
    root_path
  end

  # ログイン済みのユーザーか確認する。
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "ログインして下さい。"
      redirect_to root_url
    end
  end

  # 渡されたユーザーがログイン済みのユーザーであればtrueを返す。
  def current_user?(user)
    user == current_user
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認する。
  def correct_user
    unless current_user?(@user)
      flash[:danger] = "ログインして下さい。"
      redirect_to root_url
    end
  end

  # システム管理権限所有かどうか判定する。
  def admin_user
    unless user_signed_in? && current_user.admin?
      flash[:danger] = "ログインして下さい。"
      redirect_to root_url
    end
  end

  # 管理権限者、または現在ログインしているユーザーを許可する。
  def admin_or_correct_user
    # @user = User.find(params[:id]) if @user.blank?
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "ログインして下さい。"
      redirect_to root_url
    end
  end

  def gallery_list
    @galleries =
    if user_signed_in? && current_user.admin?
      Gallery.with_attached_image.order(:category, "display desc", :id).group_by(&:category)
    elsif user_signed_in?
      Gallery.with_attached_image.where(display: 1).order(:category, :id).group_by(&:category)
    else
      flash[:danger] = "ログインして下さい。"
      redirect_to root_url
    end
  end

  private

    # def correct_user
    #   user = User.find(params[:user_id])
    #   redirect_to root_path unless user == current_user
    # end

    def no_admin_return
      redirect_to root_path unless current_user.admin?
    end

    def no_logged_in_return
      redirect_to root_path unless user_signed_in?
    end

    def current_user_admin?
      @admin_user = current_user ? current_user.admin? : current_user
    end


  protected

    def configure_permitted_parameters
      added_attrs = [:name, :email, :member_groups, :phone_number, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

end
