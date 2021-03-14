class UsersController < ApplicationController
  before_action :set_user, only: %i(show destroy)
  before_action :logged_in_user, only: %i(index show edit update destroy)
  before_action :admin_or_correct_user, only: :show
  before_action :admin_user, only: %i(index edit update destroy)

  def index
    # if current_user.admin?
      @users = User.paginate(page: params[:page], per_page: 10).where.not(name: "管理者").order(:member_groups, :name)
    # else
    #   flash[:danger] = "ログインして下さい。"
    #   redirect_to root_path
    # end
  end

  def show
    # @user = User.find(params[:id])
  end
  
  # def new
  #   @user = User.new
  # end
  
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     flash[:success] = '新規作成に成功しました。'
  #   else
  #     flash[:success] = '新規作成に失敗しました。'
  #   end
  #   redirect_to users_path
  # end
  
  # def edit
  # end
  
  # def update
  #   if @user.update_attributes(user_params)
  #     flash[:success] = "#{@user.name}の情報を更新しました。"
  #   else
  #     flash[:danger] = "#{@user.name}の情報の更新に失敗しました。"
  #   end
  #   redirect_to users_url
  # end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}の情報を削除しました。"
    redirect_to users_url
  end


  private

    # def user_params
    #   params.require(:user).permit(:member_groups, :phone_number)
    # end

  # beforフィルター

    # paramsハッシュからユーザーを取得する。
    def set_user
      @user = User.find(params[:id])
    end

end
