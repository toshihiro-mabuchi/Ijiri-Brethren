class AdminPages::UsersController < AdminPagesController
  before_action :admin_user
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.where.not(name: "管理者").order(:member_groups, :name)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_create_params)
    if @user.save
      respond_to do |format|
        format.js { flash.now[:success] = "メンバーの新規作成に成功しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "メンバーの新規作成に失敗しました。<br>" + @user.errors.full_messages.join("<br>") }
      end
    end
    @users = User.where.not(name: "管理者").order(:member_groups, :name)
  end
  
  def edit
    
  end
  
  def update
    if @user.update_attributes(user_update_params)
      respond_to do |format|
        format.js { flash.now[:success] = "#{@user.name}の情報を更新しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "#{@user.name}の情報の更新に失敗しました。" }
      end
    end
    @users = User.where.not(name: "管理者").order(:member_groups, :name)
  end
  
  def destroy
    @user.destroy
    @users = User.where.not(name: "管理者").order(:member_groups, :name)
    respond_to do |format|
      format.js { flash.now[:success] = "#{@user.name}の情報を削除しました。" }
    end
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