module ApplicationHelper
  
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Betaman"
    env = ""
    env = " (dev)" if Rails.env.development?

    if page_title.empty?
      base_title + env
    else
      "#{base_title} | #{page_title}" + env
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
