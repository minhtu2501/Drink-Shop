class AdminController < ApplicationController
  layout 'admin'
  # # before_filter :authenticate_user!
  #  before_action :login
  
  def index
  	
  end

  def show
    @admin = Admin.find(params[:id])
  end

  # private
  #  def login
  #  	unless user_signed_in?
  #  		redirect_to new_admin_user_session_path
  #  	end
  #  end
end
