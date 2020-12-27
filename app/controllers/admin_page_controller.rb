class AdminPageController < ApplicationController

  def index
    if !current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
  end

end
