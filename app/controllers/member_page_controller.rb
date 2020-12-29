class MemberPageController < ApplicationController

  def index
    if !user_signed_in?
      flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
  end

end
