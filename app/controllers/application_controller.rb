class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  protect_from_forgery with: :exception
  semantic_breadcrumb :index, :root_path

  def set_locale
    if params[:locale]
      session[:locale] = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first || current_user.try(:locale)
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  protected

  def verify_captcha(response)
    result = RestClient.post(
        'https://www.google.com/recaptcha/api/siteverify',
        secret: Rails.application.secrets[:recaptcha][:secret_key],
        response: response
    )

    JSON.parse(result)[:success]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :avatar, :nickname, :fullname])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
