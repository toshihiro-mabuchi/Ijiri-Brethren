class AdminPages::BiblesController < ApplicationController
  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user, only: %i(new create edit update destroy)
  before_action :set_bible, only: %i(edit update destroy)

  def index
    @bibles = Bible.all.order(:id)
  end
  
  def new
    @bible = Bible.new
  end
  
  def create
    if params[:bible][:display_flag] == "1"
      unless Bible.update(display_flag: false)
        respond_to do |format|
          format.js { flash.now[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>") }
        end
      end
    end
    @bible = Bible.new(bible_params)
    if @bible.save
      respond_to do |format|
        format.js { flash.now[:success] = '御言葉の新規作成に成功しました。' }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = '御言葉の新規作成に失敗しました。' }
      end
    end   
    @bibles = Bible.all.order(:id)
  end
  
  def edit
  end

  def update
    if (@bible.display_flag == true) && (params[:bible][:display_flag] == "0")
      respond_to do |format|
        format.js { flash.now[:danger] = "表示フラグは、外せません。" }
      end
    else
      if params[:bible][:display_flag] == "1"
        unless Bible.update(display_flag: false)
          respond_to do |format|
            format.js { flash.now[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>") }
          end
        end  
      end
      if @bible.update_attributes(bible_params)
        respond_to do |format|
          format.js { flash.now[:success] = "御言葉を更新しました。" }
        end
      else
        respond_to do |format|
          format.js { flash.now[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>") }
        end
      end
    end
    @bibles = Bible.all.order(:id)
  end
  
  def destroy
    if @bible.destroy
      respond_to do |format|
        format.js { flash.now[:success] = "御言葉を削除しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "御言葉の削除に失敗しました。" }
      end
    end
    @bibles = Bible.all.order(:id)
  end
  
  private

  def bible_params
    params.require(:bible)
      .permit(:title, :subtitle, :text, :display_flag)
  end

  # beforフィルター

  # 編集するデータを取得する。
  def set_bible
    @bible = Bible.find(params[:id])
  end

end
