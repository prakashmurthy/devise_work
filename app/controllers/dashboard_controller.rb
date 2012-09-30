class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def welcome
    @users = User.all
    @current_user = current_user
  end

  def update_custom_status
    current_user.update_attributes!( :custom_status=>params["status"] )
    head 200
  end
end
