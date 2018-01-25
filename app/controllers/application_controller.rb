class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?#StrongParameterをbeforeactionする
  after_action  :store_location#ログイン前の画面を保持する


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[
      :firstname,
      :lastname,
      :kana_firstname,
      :kana_lastname,
      :postal_code,
      :address,
      :phone,
      :active])
    devise_parameter_sanitizer.permit(:account_update,keys:[
      :firstname,
      :lastname,
      :kana_firstname,
      :kana_lastname,
      :postal_code,
      :address,
      :phone,
      :active])
  end

  def store_location
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

end
