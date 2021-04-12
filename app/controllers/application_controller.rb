class ApplicationController < ActionController::Base
  # Настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    # Настройка для девайза — разрешаем обновлять профиль, но обрезаем
    # параметры, связанные со сменой пароля.
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
      )
    # разрешаем задавать username при регистрации
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:username]
      )
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править указанный пост
  def current_user_can_edit?(model)
    user_signed_in? && (
      model.user == current_user ||
      (model.try(:post).present? && model.post.user == current_user)
    )
  end
end
