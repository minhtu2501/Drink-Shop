class ApplicationController < ActionController::Base
	#before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	helper :all
    protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access denied!"
  	redirect_to '/'
	end

  def current_cart
    session[:cart_id] ||= Cart.create!.id
    @current_cart ||= Cart.find(session[:cart_id])
  end

	protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :name
	  devise_parameter_sanitizer.for(:account_update) << :name
	  @role = Role.all
      devise_parameter_sanitizer.for(:sign_up) << :role_id
      devise_parameter_sanitizer.for(:account_update) << :role_id
	end

end
