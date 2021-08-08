class ApplicationController < ActionController::Base
  before_action :set_locale
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_rescue
  include SessionsHelper
  include MicropostsHelper

  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    check = I18n.available_locales.include?(locale)
    I18n.locale = check ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def record_not_found_rescue
    flash[:danger] = t "not_found"
    redirect_to root_path
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def load_user
    @user = User.find params[:id]
  end
end
