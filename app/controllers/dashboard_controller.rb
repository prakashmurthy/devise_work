class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def welcome
    @users = User.all
  end
end
