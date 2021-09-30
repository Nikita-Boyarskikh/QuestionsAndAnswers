class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  protect_from_forgery with: :exception
  semantic_breadcrumb :index, :root_path
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new, :edit], unless: :devise_controller?

  # Отключаем лайаут для всех xhr запросов
  layout -> do
    if request.xhr?
      false
    else
      set_gon
      'application'
    end
  end

  def set_locale
    if params[:locale]
      session[:locale] = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first || current_user.try(:locale)
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  protected

  def set_gon
    #gon.current_user = current_user.public_fields if current_user
  end

  def authenticate_user!
    unless current_user
      if request.xhr?
        render json: {msg: t('js.unauthorized')}, status: 403
      else
        flash[:alert] = t('global.permission_denied')
        # redirect_to new_user_session
      end
    end
  end

  def verify_captcha(response)
    result = RestClient.post(
        'https://www.google.com/recaptcha/api/siteverify',
        secret: Rails.application.secrets[:recaptcha][:secret_key],
        response: response
    )

    JSON.parse(result)[:success]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :avatar, :nickname, :fullname, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :remember_me, :password])
  end
end
