class AdminPages::BiblesController < ApplicationController
  before_action :admin_user
  # before_action :set_bible, only: %i(edit update destroy)

  def index
    @bibles = Bible.all.order(:id)
  end

  # def new
  #   @bible = Bible.new
  # end
  
  # def create
  #   @bible = Bible.new(bible_params)
  #   if @bible.save
  #     flash[:success] = '御言葉の新規作成に成功しました。'
  #     redirect_to bibles_path
  #   else
  #     flash[:danger] = '御言葉の新規作成に失敗しました。'
  #     render :new
  #   end   
  # end

  # def edit
  # end

  # def update
  #   if @bible.update_attributes(bible_params)
  #     flash[:success] = "御言葉を更新しました。"
  #   else
  #     flash[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>")
  #   end
  #   redirect_to bibles_path
  # end

  # def destroy
  #   if @bible.destroy
  #     flash[:success] = "御言葉を削除しました。"
  #   else
  #     flash[:danger] = "御言葉の削除に失敗しました。"
  #   end
  #   redirect_to bibles_path
  # end
  
  # private

  # def bible_params
  #   params.require(:bible)
  #     .permit(:title, :subtitle, :text, :display_flag)
  # end

  # beforフィルター

  # 編集するデータを取得する。
  # def set_bible
  #   @bible = Bible.find(params[:id])
  # end

end
