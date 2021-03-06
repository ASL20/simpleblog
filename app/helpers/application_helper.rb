module ApplicationHelper
  # Возвращает путь к аватарке данного юзера
  def user_avatar(user)
    asset_pack_path('media/images/user.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end

  # Выводит flash-сообщение необходимого типа
  def bootstrap_flash(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
        concat content_tag(:button, '×', class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  private

  # Задает тип flash-сообщения
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-success'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
