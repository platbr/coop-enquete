module ApplicationHelper
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true, timeOut: 2000, positionClass: 'toast-bottom-right'})</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def nav_link(link_text, link_path)
    return link_to link_text, link_path, class: 'nav-link bg-light active', 'aria-current' => 'page' if current_page?(link_path)

    link_to link_text, link_path, class: 'nav-link'
  end
end
