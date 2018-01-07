class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  semantic_breadcrumb :index, :root_path

  def set_locale
    if params[:locale]
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  protected

  def verify_captcha(response)
    result = RestClient.post(
        "https://www.google.com/recaptcha/api/siteverify",
        secret: Rails.application.secrets[:recaptcha]["secret_key"],
        response: response
    )

    JSON.parse(result)["success"]
  end

end
