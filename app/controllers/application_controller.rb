class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :phone_number] ])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [user_address_attributes: [:post_code, :prefecture_code, :city, :house_number, :building_name]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, profile_attributes: [:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :phone_number], user_address_attributes: [:post_code, :prefecture_code, :city, :house_number, :building_name]])
  end
     
end