module ApplicationHelper
  def body_id
    "#{controller.controller_name}_#{controller.action_name}"
  end

  def bootstrap_class_for flash_type
    { success: "alert-success",
      error: "alert-error",
      alert: "alert-warning",
      notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def admin?
    current_user.admin?
  end

  def admin_menu?
    current_user && current_user.admin? && session[:admin_menu]
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message,
                         class: "alert #{bootstrap_class_for(msg_type)} fade in") do
                concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat simple_format message
      end)
    end
    nil
  end
end
