class InfosController < ApplicationController

  def index
    @infos = Info.all
  end

  def new
    @info = Info.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def strong_info

    end
end
