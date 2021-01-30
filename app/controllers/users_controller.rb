class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]

  def index
    if current_user.admin?
      @users = User.all.order(:member_groups, :name)
    else
      flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
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
