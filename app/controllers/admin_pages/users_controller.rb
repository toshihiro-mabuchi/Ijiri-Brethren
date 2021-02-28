class AdminPages::UsersController < AdminPagesController
  before_action :admin_user
  before_action :set_user, only: %i[edit update destroy]

  def index
    # if current_user.admin?
      @users = User.all.order(:member_groups)
    # else
    #   flash[:danger] = "権限がありません。"
    #   redirect_to admin_pages_path
    # end
  end

  # def show
  # end
  
  def new
    @user = User.new
  end
  
  def create
    debugger
    @user = User.new(user_create_params)
    if @user.save
      flash[:success] = 'メンバーの新規作成に成功しました。'
    else
      flash[:success] = 'メンバーの新規作成に失敗しました。'
    end
    redirect_to admin_pages_path
  end
  
  def edit

  end
  
  def update
    if @user.update_attributes(user_update_params)
      flash[:success] = "#{@user.name}の情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の情報の更新に失敗しました。"
    end
    redirect_to admin_pages_path
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}の情報を削除しました。"
    redirect_to admin_pages_path
  end


  private

    def user_create_params
      params.require(:user).permit(:name, :member_groups, :phone_number, :email, :password, :password_confirmation)
    end

    def user_update_params
      params.require(:user).permit(:name, :member_groups, :phone_number, :email)
    end

  # beforフィルター

    # paramsハッシュからユーザーを取得する。
    def set_user
      @user = User.find(params[:id])
    end

end