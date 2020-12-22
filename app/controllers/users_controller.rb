class UsersController < ApplicationController

  def index
    @users = User.all.order(:name)
  end

  def show
    @user = User.find(params[:id])
  end

  def admin_top
  end

  def member_top
  end

end
