module ApplicationHelper

  def full_title(page_name = "")
    base_title = "井尻キリスト集会"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end

  def new_topics?(created_at)
    return "NEW" if created_at > @now.prev_month
  end

  def new_hide?(created_at)
    return "info-layout__topics-is-new-hide"  if created_at <= @now.prev_month
  end

end
