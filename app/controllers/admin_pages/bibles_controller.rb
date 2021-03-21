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
    ActiveRecord::Base.transaction do
      if params[:bible][:display_flag] == "1"
        unless Bible.update(display_flag: false)
          flash[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>")
          render :new
        end  
      end
      @bible = Bible.new(bible_params)
      @bible.save!
      flash[:success] = '御言葉の新規作成に成功しました。'
      redirect_to admin_pages_path
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = '御言葉の新規作成に失敗しました。<br>' + @bible.errors.full_messages.join("<br>")
    redirect_to bibles_path
  end

  def edit
  end

  def update
    ActiveRecord::Base.transaction do
      if (@bible.display_flag == true) && (params[:bible][:display_flag] == "0")
        flash[:danger] = "表示フラグは、外せません。"
      else
        if params[:bible][:display_flag] == "1"
          unless Bible.update(display_flag: false)
            flash[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>")
          end  
        end
        if @bible.update_attributes(bible_params)
          flash[:success] = "御言葉を更新しました。"
        else
          flash[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>")
        end
      end
    end
    redirect_to admin_pages_path
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = "御言葉の更新に失敗しました。<br>" + @bible.errors.full_messages.join("<br>")
    redirect_to bibles_path
  end

  def destroy
    if @bible.destroy
      flash[:success] = "御言葉を削除しました。"
    else
      flash[:danger] = "御言葉の削除に失敗しました。"
    end
    redirect_to admin_pages_path
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
