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
end
