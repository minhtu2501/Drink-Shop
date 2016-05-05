class Admin::PagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!
  # before_action :log_in
  def index
  end
  # def log_in
  # 	if current_user.nil?	
  #    redirect_to new_admin_admin_session_path
  # 	end	
  # end
end
