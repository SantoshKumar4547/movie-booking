class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :devise_configure_permitted_parameters, if: :devise_controller?
  after_action :store_action
  
  def store_action
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  # def after_sign_in_path_for(resource)
  # 	# redirect_to request.referer if request.referer
  # 	# request.referer
  # end

  protected

  def devise_configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :gender, :password)}
  end

end
